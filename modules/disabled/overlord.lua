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
local m = Module:new("Demetrie")

local trustToReplaceName = "rughadjeen"

m:addOverride(string.format("xi.globals.spells.trust.%s.onSpellCast", trustToReplaceName), function(caster, target, spell)
   
    local trust = caster:spawnTrust(spell:getID())

    trust:setModelId(790)
    trust:renameEntity("Demetrie")

	
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.RAMPART, ai.r.JA, ai.s.SPECIFIC, xi.ja.RAMPART)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.PALISADE, ai.r.JA, ai.s.SPECIFIC, xi.ja.PALISADE)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.PHALANX, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PHALANX)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, xi.effect.SENTINEL, ai.r.JA, ai.s.SPECIFIC, xi.ja.SENTINEL)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 50, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)
    trust:addSimpleGambit(ai.t.SELF, ai.c.HPP_LT, 5, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.DEATH)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.BLIZZARD)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.THUNDER)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.FIRE)
	

    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)


	local power = trust:getMainLvl()
      trust:addMod(xi.mod.MATT, power*10)
	trust:addMod(xi.mod.ATT, power*10)
	trust:addMod(xi.mod.DEF, power*25)
      trust:addMod(xi.mod.MACC, power*10)
	trust:addMod(xi.mod.ACC, power*10)
	trust:addMod(xi.mod.DOUBLE_ATTACK, 25)
	trust:addMod(xi.mod.WSACC, power*10)
	trust:addMod(xi.mod.MDEF, power*25)
	trust:addMod(xi.mod.DEF, power*25)
      trust:addMod(xi.mod.ALL_WSDMG_ALL_HITS, power*10)
	trust:addMod(xi.mod.REFRESH, 50)
      trust:addStatusEffect(xi.effect.ENDARK, 50, 3, 0)
	trust:addMod(xi.mod.REGAIN, 70)

end)


return m