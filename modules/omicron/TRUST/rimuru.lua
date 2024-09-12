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
local m = Module:new("rimuru")

local trustToReplaceName = "aatt"

m:addOverride(string.format("xi.globals.spells.trust.%s.onSpellCast", trustToReplaceName), function(caster, target, spell)
   
    local trust = caster:spawnTrust(spell:getID())

    trust:setModelId(292) -- Trust: Rimuru
    trust:renameEntity("Rimuru")

    local boostAmount = math.ceil((30 / 99) * caster:getMainLvl())
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.HEAD_BUTT)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.HEAD_BUTT)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.HEAD_BUTT)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.HEAD_BUTT)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.PLAGUE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.BAD_BREATH)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.TERROR, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.JETTATURA)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.STATUS_FLAG, xi.effectFlag.DISPELABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.BLANK_GAZE)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.BLIZZARD)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.THUNDER)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.FIRE)
    trust:addSimpleGambit(ai.t.SELF, ai.c.HPP_LT, 30, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.DRAIN)
    trust:addSimpleGambit(ai.t.SELF, ai.c.HPP_LT, 10, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.SELF_DESTRUCT)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 25, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.MAGIC_FRUIT)

   	
    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.HIGHEST)


	local power = trust:getMainLvl()
      trust:addMod(xi.mod.MATT, power*15)
      trust:addMod(xi.mod.MACC, 1000)
	trust:addMod(xi.mod.MDEF, power*150)
	trust:addMod(xi.mod.REFRESH, 50)
      trust:addMod(xi.mod.REGAIN, 50)
	trust:addMod(xi.mod.DEF, power*80)
	trust:addMod(xi.mod.ACC, power*255)
	trust:addMod(xi.mod.ATT, power*255)
      trust:addMod(xi.mod.HASTE_MAGIC, power*5)
      trust:addStatusEffect(xi.effect.FAST_CAST, 50)
      trust:addStatusEffect(xi.effect.ENDARK, 50, 3, 0)

 trust:setLocalVar("MASTER_ID", trust:getMaster():getID())
end)

m:addOverride(string.format("xi.globals.spells.trust.%s.onMobSpawn", trustToReplaceName), function(mob)
    for _, member in ipairs(mob:getMaster():getParty()) do
        if member:isPC() then
            member:PrintToPlayer("Warui suraimu janai yo!", 4, "Rimuru") -- 4: MESSAGE_PARTY
        end
    end
end)

m:addOverride(string.format("xi.globals.spells.trust.%s.onMobDespawn", trustToReplaceName), function(mob)
    local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:PrintToPlayer("As you have just learned through experience, I am strong!", 4, "Rimuru") -- 4: MESSAGE_PARTY
        end
    end
end)

m:addOverride(string.format("xi.globals.spells.trust.%s.onMobDeath", trustToReplaceName), function(mob)
    local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:PrintToPlayer("I underestimated you, but not as much as you underestimated me.", 4, "Rimuru") -- 4: MESSAGE_PARTY
	  end
    end
end)

return m