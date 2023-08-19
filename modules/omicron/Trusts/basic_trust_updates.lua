-----------------------------------
require("modules/module_utils")
require("scripts/globals/magic")
require("scripts/globals/weaponskillids")

require("scripts/globals/trust")
require("scripts/globals/utils")
require("scripts/globals/ability")

require("scripts/globals/gambits")
-----------------------------------
local m = Module:new("basic_trust_updates")

m:addOverride("xi.globals.spells.trust.ayame.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())


local power = trust:getMainLvl()
	trust:addMod(xi.mod.DEF, power)
	trust:addMod(xi.mod.MDEF, power)
	trust:addMod(xi.mod.ACC, power*9)
	trust:addMod(xi.mod.ATT, power)
      trust:addMod(xi.mod.WSACC, power*3)
end)

m:addOverride("xi.globals.spells.trust.zeid.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())


local power = trust:getMainLvl()
	trust:addMod(xi.mod.DEF, power)
	trust:addMod(xi.mod.MDEF, power)
	trust:addMod(xi.mod.ACC, power*9)
	trust:addMod(xi.mod.ATT, power)
      trust:addMod(xi.mod.WSACC, power*3)
end)

m:addOverride("xi.globals.spells.trust.cid.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())

    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.BERSERK, ai.r.JA, ai.s.SPECIFIC, xi.ja.BERSERK)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.WARCRY, ai.r.JA, ai.s.SPECIFIC, xi.ja.WARCRY)

    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)

local power = trust:getMainLvl()
	trust:addMod(xi.mod.DEF, power)
	trust:addMod(xi.mod.MDEF, power)
	trust:addMod(xi.mod.ACC, power*9)
	trust:addMod(xi.mod.ATT, power)
	trust:addMod(xi.mod.DOUBLE_ATTACK, 25)
      trust:addMod(xi.mod.WSACC, power*3)
end)

return m 