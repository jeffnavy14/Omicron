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
local m = Module:new("trusts")

m:addOverride("xi.globals.spells.trust.valaineral.onSpellCast", function(caster, target, spell)

 		local trust = caster:spawnTrust(spell:getID())

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)

    mob:addSimpleGambit(ai.t.TARGET, ai.c.OT_HAS_TOP_ENMITY, xi.effect.FLASH, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.FLASH)

    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, xi.effect.SENTINEL, ai.r.JA, ai.s.SPECIFIC, xi.ja.SENTINEL)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 50, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)

    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)

local power = trust:getMainLvl()
      trust:addMod(xi.mod.MATT, power)
      trust:addMod(xi.mod.MACC, power)
	trust:addMod(xi.mod.DEF, power)
	trust:addMod(xi.mod.MDEF, power)
	trust:addMod(xi.mod.ATT, power*3)
	trust:addMod(xi.mod.ACC, power*5)
	trust:addMod(xi.mod.FASTCAST, power)
	trust:addMod(xi.mod.CURE_POTENCY, power)
	trust:addMod(xi.mod.ENMITY, power*25)
	trust:addMod(xi.mod.WSACC, power*3)