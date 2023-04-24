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
local m = Module:new("arkmr")

m:addOverride("xi.globals.spells.trust.aamr.onSpellCast", function(caster, target, spell)
   
    local trust = caster:spawnTrust(spell:getID())

    local boostAmount = math.ceil((30 / 99) * caster:getMainLvl())
    trust:addSimpleGambit(ai.t.MASTER, ai.c.READYING_WS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SNEAK_ATTACK)
    trust:addSimpleGambit(ai.t.MASTER, ai.c.READYING_WS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.ASSASSINS_CHARGE)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.DOUBT, ai.r.JA, ai.s.SPECIFIC, xi.ja.BULLY)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.CONSPIRATOR, ai.r.JA, ai.s.SPECIFIC, xi.ja.CONSPIRATOR)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.EVASION_DOWN, ai.r.JA, ai.s.SPECIFIC, xi.ja.FEINT)
    trust:addSimpleGambit(ai.t.SELF, ai.c.HPP_LT, 10, xi.effect.PERFECT_DODGE, ai.r.JA, ai.s.SPECIFIC, xi.ja.PERFECT_DODGE)

    trust:setTrustTPSkillSettings(ai.tp.CLOSER, ai.s.RANDOM)


	local power = trust:getMainLvl()
      trust:addMod(xi.mod.MATT, power)
      trust:addMod(xi.mod.MACC, 1000)
	trust:addMod(xi.mod.MDEF, power*50)
	trust:addMod(xi.mod.DOUBLE_ATTACK, 15)
	trust:addMod(xi.mod.TRIPLE_ATTACK, 25)
	trust:addMod(xi.mod.TP_BONUS, 100)
	trust:addMod(xi.mod.DEF, power*70)
	trust:addMod(xi.mod.ACC, power*255)
	trust:addMod(xi.mod.ATT, power*20)
	trust:addMod(xi.mod.AXE, power*6)
	trust:addMod(xi.mod.TREASURE_HUNTER, 1)
      trust:addMod(xi.mod.ALL_WSDMG_ALL_HITS, power/3)
      trust:addMod(xi.mod.WSACC, power*3)
end)

return m