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
local m = Module:new("balamor")

m:addOverride("xi.globals.spells.trust.balamor.onSpellCast", function(caster, target, spell)
   
    local trust = caster:spawnTrust(spell:getID())

    local boostAmount = math.ceil((30 / 99) * caster:getMainLvl())
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.LAST_RESORT)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.BLIZZARD)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.THUNDER)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.FIRE)
    trust:addSimpleGambit(ai.t.SELF, ai.c.HPP_LT, 50, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.DRAIN)
    trust:addSimpleGambit(ai.t.SELF, ai.c.HPP_LT, 25, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.METEOR)
    trust:addSimpleGambit(ai.t.SELF, ai.c.HPP_LT, 15, ai.r.JA, ai.s.SPECIFIC, xi.ja.BLOOD_WEAPON)
    trust:addSimpleGambit(ai.t.SELF, ai.c.HPP_LT, 5, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.DEATH)

    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.HIGHEST)


	local power = trust:getMainLvl()
      trust:addMod(xi.mod.MATT, power*4)
      trust:addMod(xi.mod.MACC, 1000)
	trust:addMod(xi.mod.MDEF, power*70)
	trust:addMod(xi.mod.DOUBLE_ATTACK, 25)
	trust:addMod(xi.mod.REFRESH, 50)
      trust:addMod(xi.mod.REGAIN, 50)
	trust:addMod(xi.mod.DEF, power*70)
	trust:addMod(xi.mod.ACC, power*255)
	trust:addMod(xi.mod.ATT, power*20)
      trust:addMod(xi.mod.HASTE_MAGIC, 50)
      trust:addStatusEffect(xi.effect.ENDARK, 50, 3, 0)


 trust:setLocalVar("MASTER_ID", trust:getMaster():getID())
end)

return m