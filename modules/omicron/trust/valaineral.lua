-----------------------------------
require("modules/module_utils")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/trust")
require("scripts/globals/utils")
require("scripts/globals/zone")
-----------------------------------

local m = Module:new("trusts")
m:addOverride("xi.globals.spells.trust.valaineral.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())

    trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, xi.effect.RAMPART, ai.r.JA, ai.s.SPECIFIC, xi.ja.RAMPART)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.PHALANX, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PHALANX)

local power = trust:getMainLvl()
	trust:addMod(xi.mod.DEF, power*2)
	trust:addMod(xi.mod.ACC, power*9)
	trust:addMod(xi.mod.ENMITY, power*220)
	trust:addMod(xi.mod.ATT, power*8)
	trust:addMod(xi.mod.ENMITY_BOOST, power*3)
end)

return m 