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
local m = Module:new("lilith")

local trustToReplaceName = "mumor_ii"

m:addOverride(string.format("xi.globals.spells.trust.%s.onSpellCast", trustToReplaceName), function(caster, target, spell)
   
    local trust = caster:spawnTrust(spell:getID())

    trust:setModelId(2189)
    trust:renameEntity("Lilith")


    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.NONE)
    trust:addSimpleGambit(ai.t.MASTER, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.THUNDAJA, 100)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:SetMobSkillAttack(730)

    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)


	local power = trust:getMainLvl()
      trust:addMod(xi.mod.MATT, power)
      trust:addMod(xi.mod.MACC, 1000)
	trust:addMod(xi.mod.MDEF, power*16)
	trust:addMod(xi.mod.DEF, power*12)
      trust:addMod(xi.mod.ALL_WSDMG_ALL_HITS, power*20)
	trust:addMod(xi.mod.REFRESH, 60)
      trust:addMod(xi.mod.REGAIN, 75)
      trust:addMod(xi.mod.HASTE_MAGIC, power*5)
      trust:addStatusEffect(xi.effect.FAST_CAST, 50)
      trust:addStatusEffect(xi.effect.ENMITY_DOWN, power)

 trust:setLocalVar("MASTER_ID", trust:getMaster():getID())
end)

m:addOverride(string.format("xi.globals.spells.trust.%s.onMobSpawn", trustToReplaceName), function(mob)
    for _, member in ipairs(mob:getMaster():getParty()) do
        if member:isPC() then
            member:PrintToPlayer("Fear is what creates order.", 4, "Lilith") -- 4: MESSAGE_PARTY
        end
    end
end)

m:addOverride(string.format("xi.globals.spells.trust.%s.onMobDespawn", trustToReplaceName), function(mob)
    local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:PrintToPlayer("The weak are destined to lie beneath the boots of the strong. If that angers you, overcome your deficits.", 4, "Lilith") -- 4: MESSAGE_PARTY
        end
    end
end)

m:addOverride(string.format("xi.globals.spells.trust.%s.onMobDeath", trustToReplaceName), function(mob)
    local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:PrintToPlayer("The opposite of boredom is not pleasure, but excitement. People will gladly seek out any kind of excitement, even pain.", 4, "Lilith") -- 4: MESSAGE_PARTY
	  end
    end
end)

return m