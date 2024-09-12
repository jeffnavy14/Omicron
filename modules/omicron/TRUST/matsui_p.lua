-----
require("modules/module_utils")
require("scripts/globals/zone")
require("scripts/globals/magic")
require("scripts/globals/weaponskillids")
require("scripts/globals/status")
require("scripts/globals/trust")
-----
local m = Module:new("trusts")

local trustToReplaceName = "moogle"

m:addOverride(string.format("xi.globals.spells.trust.%s.onSpellCast", trustToReplaceName), function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())

    trust:setModelId(3121) -- Trust: Matsui-P
    trust:renameEntity("Epic Taru")

    local boostAmount = math.ceil((30 / 99) * caster:getMainLvl())
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.COPY_IMAGE, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.UTSUSEMI)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.RAITON)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.HYOTON)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.KATON)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.INNIN, ai.r.JA, ai.s.SPECIFIC, xi.ja.INNIN)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.MIKAGE, ai.r.JA, ai.s.SPECIFIC, xi.ja.MIKAGE)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ISSEKIGAN, ai.r.JA, ai.s.SPECIFIC, xi.ja.ISSEKIGAN)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.DRAIN_SAMBA, ai.r.JA, ai.s.SPECIFIC, xi.ja.DRAIN_SAMBA_III)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.SLOW, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.HOJO, 60)

    trust:setTrustTPSkillSettings(ai.tp.OPENER, ai.s.RANDOM)
	
	local power = trust:getMainLvl()
      trust:addMod(xi.mod.MATT, power*2)
      trust:addMod(xi.mod.MACC, power)
	trust:addMod(xi.mod.MDEF, power*5)
      trust:addMod(xi.mod.REGAIN, 50)
	trust:addMod(xi.mod.DEF, power*5)
	trust:addMod(xi.mod.ACC, power*155)
	trust:addMod(xi.mod.ATT, power*5)
	trust:addMod(xi.mod.EVA, power*4)
	trust:addMod(xi.mod.ENMITY, power*25)
      trust:addMod(xi.mod.HASTE_MAGIC, power*5)
	trust:addMod(xi.mod.DOUBLE_ATTACK, 15)
      trust:addStatusEffect(xi.effect.FAST_CAST, 50)
      trust:addStatusEffect(xi.effect.HASTE, 60)
      trust:addStatusEffect(xi.effect.MARTIAL_ARTS, 50)

 	trust:setLocalVar("MASTER_ID", trust:getMaster():getID())
end)

m:addOverride(string.format("xi.globals.spells.trust.%s.onMobSpawn", trustToReplaceName), function(mob)
    for _, member in ipairs(mob:getMaster():getParty()) do
        if member:isPC() then
            member:PrintToPlayer("Greetings, adventurers! Matsui here, happy to join you in Vana'diel!", 4, "Matsui-P") --4: MESSAGE_PARTY
        end 
    end
end)

m:addOverride(string.format("xi.globals.spells.trust.%s.onMobDespawn", trustToReplaceName), function(mob)
    local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:PrintToPlayer("How'd I do? And don't say my alter ego did it better!", 4, "Matsui-P") -- 4: MESSAGE_PARTY
        end
    end
end)

m:addOverride(string.format("xi.globals.spells.trust.%s.onMobDeath", trustToReplaceName), function(mob)
    local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:PrintToPlayer("Wait...something's wrong with my macros.", 4, "Matsui-P") -- 4: MESSAGE_PARTY
	  end
    end
end)
return m 





