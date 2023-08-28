-----------------------------------
require("modules/module_utils")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/trust")
-----------------------------------
local trusts = Module:new("trusts")

    -- All trusts rework (leonoyne, ygnas these 2 are to op for players but great for GMs), aaev, elivira, halver, rainemard, zeid_ii, gessho, maximilian, semih_lafihna, 
	-- maat, mayakov, volker, uka_totlihn, naja_salaheem, nanaa_mihgo, qultada, kupofried, matsui-p(moogle), Lady Lilith(lilisette_ii), aamr, selh'teus, Rimuru(att),
    -- Demetrie(rughadjeen), Mini Maw(brygid), Kam'lanaut(rahal), Cornelia(kuyin_hathdenna), Cait Sith(monberaux), ayame, zeid, cid, 
trusts:addOverride("xi.globals.spells.trust.ygnas.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())
	
    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 25, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)

    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SLEEP_I, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SLEEP_II, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE)

    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)

    trust:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.PROTECT, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PROTECTRA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.SHELL, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.SHELLRA)

    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.POISON, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.POISONA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.PARALYSIS, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.PARALYNA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.BLINDNESS, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.BLINDNA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SILENCE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.SILENA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.PETRIFICATION, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STONA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.DISEASE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.VIRUNA)
   
    trust:addSimpleGambit(ai.t.SELF, ai.c.STATUS_FLAG, xi.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ERASE)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS_FLAG, xi.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ERASE)

    local power = trust:getMainLvl()
    trust:addMod(xi.mod.CURE_CAST_TIME, power)
	trust:addMod(xi.mod.MACC, power)
	trust:addMod(xi.mod.CURE_POTENCY, power)
	trust:addMod(xi.mod.DEF, power)
	trust:addMod(xi.mod.MDEF, power)
	trust:addMod(xi.mod.REFRESH, power)
	trust:addMod(xi.mod.HASTE_MAGIC, power)
	trust:SetAutoAttackEnabled(false)
end)

trusts:addOverride("xi.globals.spells.trust.aaev.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())
	
	trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.FLASH, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.FLASH)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.RAMPART, ai.r.JA, ai.s.SPECIFIC, xi.ja.RAMPART)
	trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.PALISADE, ai.r.JA, ai.s.SPECIFIC, xi.ja.PALISADE)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, xi.effect.SENTINEL, ai.r.JA, ai.s.SPECIFIC, xi.ja.SENTINEL)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 50, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)
	trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.PHALANX, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PHALANX)
	trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ENLIGHT, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.ENLIGHT)
	
	
	trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)
	
	local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
	trust:addMod(xi.mod.DEF, power)
	trust:addMod(xi.mod.MDEF, power)
	trust:addMod(xi.mod.ATT, power*3)
	trust:addMod(xi.mod.ACC, power*5)
	trust:addMod(xi.mod.REGEN, 1)
	trust:addMod(xi.mod.ABSORB_DMG_TO_MP, 5)
	trust:addMod(xi.mod.FASTCAST, power/2)
	trust:addMod(xi.mod.CURE_POTENCY, power)
	trust:addMod(xi.mod.ENMITY, power*111)
end)

trusts:addOverride("xi.globals.spells.trust.elivira.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())
	
    trust:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.EVOKERS_ROLL, ai.r.JA, ai.s.SPECIFIC, xi.ja.EVOKERS_ROLL)  -- Refresh
    trust:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.WARLOCKS_ROLL, ai.r.JA, ai.s.SPECIFIC, xi.ja.WARLOCKS_ROLL) -- Magic Accuracy

    trust:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.RATTACK, 0, 0, 10)

    -- Notable: Uses a balance of melee and ranged attacks.
    -- TODO: Observe his WS behaviour on retail
    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)
    local power = trust:getMainLvl()
    trust:addMod(xi.mod.WSACC, power*3)
	trust:addMod(xi.mod.ACC, power*2)	
end)

trusts:addOverride("xi.globals.spells.trust.halver.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())
	
	trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, xi.effect.SENTINEL, ai.r.JA, ai.s.SPECIFIC, xi.ja.SENTINEL)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 50, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)
	trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.FLASH, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.FLASH)
	trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)
	trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)
	
	local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
	trust:addMod(xi.mod.DEF, power)
	trust:addMod(xi.mod.MDEF, power)
	trust:addMod(xi.mod.ATT, power)
	trust:addMod(xi.mod.ACC, power*4)
    trust:addMod(xi.mod.ENMITY, power*25)
end)

trusts:addOverride("xi.globals.spells.trust.rainemard.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())
	
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.COMPOSURE, ai.r.JA, ai.s.SPECIFIC, xi.ja.COMPOSURE)
	trust:addSimpleGambit(ai.t.SELF, ai.c.MPP_LT, 5, ai.r.JA, ai.s.SPECIFIC, xi.ja.CONVERT)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 50, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)
    trust:addSimpleGambit(ai.t.MELEE, ai.c.NOT_STATUS, xi.effect.HASTE, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.HASTE)
    trust:addSimpleGambit(ai.t.CASTER, ai.c.NOT_STATUS, xi.effect.REFRESH, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.REFRESH)
	trust:addSimpleGambit(ai.t.TANK, ai.c.NOT_STATUS, xi.effect.REFRESH, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.REFRESH)
    trust:addSimpleGambit(ai.t.RANGED, ai.c.NOT_STATUS, xi.effect.FLURRY, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.FLURRY)
    trust:addSimpleGambit(ai.t.TOP_ENMITY, ai.c.NOT_STATUS, xi.effect.PHALANX, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PHALANX)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.STATUS_FLAG, xi.effectFlag.DISPELABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.DISPEL)
	trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.ENBLIZZARD, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.ENBLIZZARD, 60)
	trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.DIA, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.DIA, 60)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.SLOW, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.SLOW, 60)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.EVASION_DOWN, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.DISTRACT, 60)	
	
	trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)
	
	local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power*2)
	trust:addMod(xi.mod.DEF, power)
	trust:addMod(xi.mod.MDEF, power)
	trust:addMod(xi.mod.ENSPELL_DMG, power/4)
    trust:addMod(xi.mod.HASTE_MAGIC, power/3)
	trust:addMod(xi.mod.ATT, power)
	trust:addMod(xi.mod.ACC, power*2)
end)

trusts:addOverride("xi.globals.spells.trust.zeid_ii.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())

    -- Stun all the things!
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)

    -- Non-stun things
    trust:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SOULEATER)
    trust:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.LAST_RESORT)
    trust:setTrustTPSkillSettings(ai.tp.CLOSER, ai.s.RANDOM)
	
	local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
	trust:addMod(xi.mod.DEF, power)
	trust:addMod(xi.mod.MDEF, power)
	trust:addMod(xi.mod.ATT, power)
	trust:addMod(xi.mod.ACC, power*3)	
end)

trusts:addOverride("xi.globals.spells.trust.gessho.onSpellCast", function(caster, target, spell)	
	
	    local trust = caster:spawnTrust(spell:getID())
		
	xi.trust.teamworkMessage(trust, {
        [xi.magic.spell.NAJA_SALAHEEM] = xi.trust.message_offset.TEAMWORK_1,
        [xi.magic.spell.ABQUHBAH] = xi.trust.message_offset.TEAMWORK_2,
    })

    trust:addListener("WEAPONSKILL_USE", "GESSHO_WEAPONSKILL_USE", function(mobArg, target, wsid, tp, action)
        if wsid == 3257 then -- Shibaraku
            -- You have left me no choice. Prepare yourself!
            xi.trust.message(mobArg, xi.trust.message_offset.SPECIAL_MOVE_1)
        end
    end)

    -- Shadows are represented by xi.effect.COPY_IMAGE, but with different icons depending on the tier
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.COPY_IMAGE, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.UTSUSEMI)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.BLINDNESS, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.KURAYAMI, 60)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.SLOW, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.HOJO, 60)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.YONIN, ai.r.JA, ai.s.SPECIFIC, xi.ja.YONIN)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)
    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)
	
	local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
	trust:addMod(xi.mod.DEF, power)
	trust:addMod(xi.mod.MDEF, power)
	trust:addMod(xi.mod.ATT, power)
	trust:addMod(xi.mod.ACC, power*4)
	trust:addMod(xi.mod.DOUBLE_ATTACK, 15)
	trust:addMod(xi.mod.ENMITY, power*60)
end)

trusts:addOverride("xi.globals.spells.trust.maximilian.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())
	
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.COPY_IMAGE, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.UTSUSEMI)
	trust:setTrustTPSkillSettings(ai.tp.OPENER, ai.s.HIGHEST)
	
	local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
	trust:addMod(xi.mod.DEF, power)
	trust:addMod(xi.mod.MDEF, power)
	trust:addMod(xi.mod.ATT, power)
	trust:addMod(xi.mod.ACC, power*4)
--	trust:addMod(xi.mod.TREASURE_HUNTER, 1)
	trust:addMod(xi.mod.DOUBLE_ATTACK, 15)
end)

trusts:addOverride("xi.globals.spells.trust.semih_lafihna.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())

    xi.trust.teamworkMessage(trust, {
        [xi.magic.spell.STAR_SIBYL] = xi.trust.message_offset.TEAMWORK_1,
        [xi.magic.spell.AJIDO_MARUJIDO] = xi.trust.message_offset.TEAMWORK_2,
    })

    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.BARRAGE, ai.r.JA, ai.s.SPECIFIC, xi.ja.BARRAGE)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.SHARPSHOT, ai.r.JA, ai.s.SPECIFIC, xi.ja.SHARPSHOT)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.DOUBLE_SHOT, ai.r.JA, ai.s.SPECIFIC, xi.ja.DOUBLE_SHOT)

    -- TODO: Stealth Shot not yet implemented
    -- trust:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0,
    --                    ai.r.JA, ai.s.SPECIFIC, xi.ja.STEALTH_SHOT)

    trust:addListener("WEAPONSKILL_USE", "SEMIH_LAFIHNA_WEAPONSKILL_USE", function(mobArg, target, wsid, tp, action)
        if wsid == 3490 then -- Stellar Arrow
            -- I'll show you no quarter!
            xi.trust.message(mobArg, xi.trust.message_offset.SPECIAL_MOVE_1)
        end
    end)

    -- Ranged Attack as much as possible (limited by "weapon" delay)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.RATTACK, 0, 0)
    trust:SetAutoAttackEnabled(false)
    trust:addMod(xi.mod.STORETP, 40)
    trust:addMod(xi.mod.RACC, power*3)	
end)

trusts:addOverride("xi.globals.spells.trust.maat.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())

    trust:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.MANTRA)

    trust:addListener("WEAPONSKILL_USE", "MAAT_WEAPONSKILL_USE", function(mobArg, target, wsid, tp, action)
        if wsid == 3263 then -- Bear Killer
            --  Heh heh heh
            xi.trust.message(mobArg, xi.trust.message_offset.SPECIAL_MOVE_1)
        end
    end)
	trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.HIGHEST)
	
	local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
	trust:addMod(xi.mod.DEF, power)
	trust:addMod(xi.mod.MDEF, power)
	trust:addMod(xi.mod.ATT, power*2)
	trust:addMod(xi.mod.ACC, power*3)
	trust:addMod(xi.mod.DOUBLE_ATTACK, 15)
end)

trusts:addOverride("xi.globals.spells.trust.leonoyne.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())
	
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SOULEATER)
    trust:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.LAST_RESORT)
	trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.BLIZZARD)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.THUNDER)
	trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)
	
	local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power*2)
    trust:addMod(xi.mod.MACC, power*2)
	trust:addMod(xi.mod.DEF, power*2)
	trust:addMod(xi.mod.MDEF, power*2)
	trust:addMod(xi.mod.ATT, power*3)
	trust:addMod(xi.mod.ACC, power*5)
	trust:addMod(xi.mod.DOUBLE_ATTACK, 20)
	trust:addMod(xi.mod.TRIPLE_ATTACK, 9)
	trust:addMod(xi.mod.STORETP, 100)
	trust:addMod(xi.mod.REFRESH, 3)
end)

trusts:addOverride("xi.globals.spells.trust.mayakov.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())
	
    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 65, ai.r.JA, ai.s.HIGHEST_WALTZ, xi.ja.CURING_WALTZ)
	trust:addSimpleGambit(ai.t.SELF, ai.c.NO_SAMBA, 0, ai.r.JA, ai.s.BEST_SAMBA, xi.ja.HASTE_SAMBA)
	trust:addSimpleGambit(ai.t.SELF, ai.c.STATUS_FLAG, xi.effectFlag.WALTZABLE, ai.r.JA, ai.s.SPECIFIC, xi.ja.HEALING_WALTZ)
	trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.SABER_DANCE, ai.r.JA, ai.s.SPECIFIC, xi.ja.SABER_DANCE)
	trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)
	
	local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
	trust:addMod(xi.mod.DEF, power)
	trust:addMod(xi.mod.MDEF, power)
	trust:addMod(xi.mod.ATT, power)
	trust:addMod(xi.mod.ACC, power*4)
	trust:addMod(xi.mod.STORETP, 10)
    trust:addMod(xi.mod.DOUBLE_ATTACK, 15)
end)

trusts:addOverride("xi.globals.spells.trust.volker.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())

xi.trust.teamworkMessage(trust, {
    [xi.magic.spell.NAJI] = xi.trust.message_offset.TEAMWORK_1,
    [xi.magic.spell.CID] = xi.trust.message_offset.TEAMWORK_2,
    [xi.magic.spell.KLARA] = xi.trust.message_offset.TEAMWORK_3,
})

    trust:addSimpleGambit(ai.t.MASTER, ai.c.HPP_LT, 50, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)
	trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.WARCRY, ai.r.JA, ai.s.SPECIFIC, xi.ja.WARCRY)	
	trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.AGGRESSOR, ai.r.JA, ai.s.SPECIFIC, xi.ja.AGGRESSOR)
	trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.BERSERK, ai.r.JA, ai.s.SPECIFIC, xi.ja.BERSERK)
	trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.RETALIATION, ai.r.JA, ai.s.SPECIFIC, xi.ja.RETALIATION)
	trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)	
	
    local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
	trust:addMod(xi.mod.DEF, power)
	trust:addMod(xi.mod.MDEF, power)
	trust:addMod(xi.mod.ATT, power)
	trust:addMod(xi.mod.ACC, power*4)
    trust:addMod(xi.mod.ENMITY, power*25)
end)

trusts:addOverride("xi.globals.spells.trust.uka_totlihn.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())

    xi.trust.teamworkMessage(trust, {
        [xi.magic.spell.ULLEGORE] = xi.trust.message_offset.TEAMWORK_1,
        [xi.magic.spell.MUMOR] = xi.trust.message_offset.TEAMWORK_2,
    })

    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 50, ai.r.JA, ai.s.HIGHEST_WALTZ, xi.ja.CURING_WALTZ)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.FINISHING_MOVE_5, ai.r.JA, ai.s.SPECIFIC, xi.ja.QUICKSTEP, 20)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NO_SAMBA, 0, ai.r.JA, ai.s.BEST_SAMBA, xi.ja.HASTE_SAMBA)
    trust:addSimpleGambit(ai.t.SELF, ai.c.STATUS_FLAG, xi.effectFlag.WALTZABLE, ai.r.JA, ai.s.SPECIFIC, xi.ja.HEALING_WALTZ)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.VIOLENT_FLOURISH)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.VIOLENT_FLOURISH)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.VIOLENT_FLOURISH)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.VIOLENT_FLOURISH)
    trust:addSimpleGambit(ai.t.SELF, ai.c.STATUS, xi.effect.FINISHING_MOVE_5, ai.r.JA, ai.s.SPECIFIC, xi.ja.REVERSE_FLOURISH, 60)
	trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)	
	
    local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
	trust:addMod(xi.mod.DEF, power)
	trust:addMod(xi.mod.MDEF, power)
	trust:addMod(xi.mod.ATT, power)
	trust:addMod(xi.mod.ACC, power*3)
	trust:addMod(xi.mod.STORETP, 10)	
end)

trusts:addOverride("xi.globals.spells.trust.naja_salaheem.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())

    xi.trust.teamworkMessage(trust, {
        [xi.magic.spell.GESSHO] = xi.trust.message_offset.TEAMWORK_1,
        [xi.magic.spell.RONGELOUTS] = xi.trust.message_offset.TEAMWORK_2,
        [xi.magic.spell.ABQUHBAH] = xi.trust.message_offset.TEAMWORK_3,
    })

    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)

    trust:addListener("WEAPONSKILL_USE", "NAJA_WEAPONSKILL_USE", function(mobArg, target, wsid, tp, action)
        if wsid == 3215 then -- Peacebreaker
            --  Cha-ching! Thirty gold coins!
            xi.trust.message(mobArg, xi.trust.message_offset.SPECIAL_MOVE_1)
        end
    end)

    trust:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.FOCUS)
    trust:addSimpleGambit(ai.t.SELF, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.DODGE)
    trust:addSimpleGambit(ai.t.SELF, ai.c.HAS_TOP_ENMITY, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.COUNTERSTANCE)
			
    local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
	trust:addMod(xi.mod.DEF, power)
	trust:addMod(xi.mod.MDEF, power)
	trust:addMod(xi.mod.ATT, power)
	trust:addMod(xi.mod.ACC, power*3)
	trust:addMod(xi.mod.STORETP, 10)	
end)

trusts:addOverride("xi.globals.spells.trust.nanaa_mihgo.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())

    xi.trust.teamworkMessage(trust, {
        [xi.magic.spell.ROMAA_MIHGO] = xi.trust.message_offset.TEAMWORK_1,
    })

    trust:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.DESPOIL)
    trust:setTrustTPSkillSettings(ai.tp.OPENER, ai.s.HIGHEST)
	
    local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
	trust:addMod(xi.mod.DEF, power)
	trust:addMod(xi.mod.MDEF, power)
	trust:addMod(xi.mod.ATT, power)
	trust:addMod(xi.mod.ACC, power*3)
	trust:addMod(xi.mod.STORETP, 10)
--	trust:addMod(xi.mod.TREASURE_HUNTER, 1)	
end)

trusts:addOverride("xi.globals.spells.trust.qultada.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())

    trust:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.SAMURAI_ROLL, ai.r.JA, ai.s.SPECIFIC, xi.ja.SAMURAI_ROLL)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.FIGHTERS_ROLL, ai.r.JA, ai.s.SPECIFIC, xi.ja.FIGHTERS_ROLL)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.ALWAYS, 0, ai.r.RATTACK, 0, 0, 10)
    trust:setTrustTPSkillSettings(ai.tp.OPENER, ai.s.RANDOM)

    local power = trust:getMainLvl() / 3
    trust:addMod(xi.mod.MACC, power)
end)

trusts:addOverride("xi.globals.spells.trust.kupofried.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())

	trust:addStatusEffectEx(xi.effect.COLURE_ACTIVE, xi.effect.COLURE_ACTIVE, 6, 3, 0, xi.effect.CORSAIRS_ROLL, 150, xi.auraTarget.ALLIES, xi.effectFlag.AURA)
    trust:SetAutoAttackEnabled(false)
end)

trusts:addOverride("xi.globals.spells.trust.aahm.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())

    local power = trust:getMainLvl() / 3

    trust:addMod(xi.mod.DEF, power)
    trust:addMod(xi.mod.ATT, power * 3)
    trust:addMod(xi.mod.ACC, power * 5)
    trust:addMod(xi.mod.UTSUSEMI_BONUS, 1)

--    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.MIGAWARI, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.MIGAWARI)

    -- Shadows are represented by xi.effect.COPY_IMAGE, but with different icons depending on the tier
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.COPY_IMAGE, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.UTSUSEMI)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.BLINDNESS, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.KURAYAMI, 60)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.SLOW, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.HOJO, 60)

    -- DD Mode
    trust:addSimpleGambit(ai.t.SELF, ai.c.PT_HAS_TANK, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.BERSERK)
    trust:addSimpleGambit(ai.t.SELF, ai.c.PT_HAS_TANK, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.INNIN)
    trust:addSimpleGambit(ai.t.TANK, ai.c.HPP_LT, 50, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)

    -- Tank Mode
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_PT_HAS_TANK, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_PT_HAS_TANK, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.WARCRY)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_PT_HAS_TANK, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.YONIN)
    trust:addSimpleGambit(ai.t.MASTER, ai.c.HPP_LT, 50, ai.r.JA, ai.s.SPECIFIC, xi.ja.PROVOKE)
    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)
end)

local trustToReplaceName = "moogle"

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onSpellCast", trustToReplaceName), function(caster, target, spell)

    -----------------------------------
    -- NOTE: This is the logic from xi.trust.spawn()
    -----------------------------------
    local trust = caster:spawnTrust(spell:getID())

    trust:setModelId(3121) -- Trust: Matsui-P
    trust:renameEntity("Matsui-P")

    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.COPY_IMAGE, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.UTSUSEMI)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.BLINDNESS, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.KURAYAMI)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.SLOW, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.HOJO)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.NONE) 
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.NONE, 45)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)	
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.INNIN, ai.r.JA, ai.s.SPECIFIC, xi.ja.INNIN)
    trust:setTrustTPSkillSettings(ai.tp.OPENER, ai.s.RANDOM)
	
	local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
	trust:addMod(xi.mod.DEF, power)
	trust:addMod(xi.mod.MDEF, power)
	trust:addMod(xi.mod.ATT, power)
	trust:addMod(xi.mod.ACC, power*4)
	trust:addMod(xi.mod.DOUBLE_ATTACK, 25)	
    trust:addMod(xi.mod.MP, 150)	
end)

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onMobSpawn", trustToReplaceName), function(mob)
    for _, member in ipairs(mob:getMaster():getParty()) do
        if member:isPC() then
            member:PrintToPlayer("Matsui-P, Lets get this party started", 4, "Matsui-P") --4: MESSAGE_PARTY
        end 
    end
end)

local trustToReplaceName = "lilisette_ii"

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onSpellCast", trustToReplaceName), function(caster, target, spell)

    -----------------------------------
    -- NOTE: This is the logic from xi.trust.spawn()
    -----------------------------------
	local trust = caster:spawnTrust(spell:getID())

    trust:setModelId(2189) -- Trust: Lady Lilith
    trust:renameEntity("Lady Lilith")

    trust:addSimpleGambit(ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.NONE)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_SC_AVAILABLE, 0, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.NONE, 40)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
	trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN)
    trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)

	local power = trust:getMainLvl()
	trust:addMod(xi.mod.DEF, power)
	trust:addMod(xi.mod.MDEF, power)
	trust:addMod(xi.mod.ATT, power)
	trust:addMod(xi.mod.ACC, power*4)
	trust:addMod(xi.mod.DOUBLE_ATTACK, 25)
    trust:addMod(xi.mod.MP, 250)
	trust:addMod(xi.mod.REFRESH, 3)
end)

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onMobSpawn", trustToReplaceName), function(mob)
    for _, member in ipairs(mob:getMaster():getParty()) do
        if member:isPC() then
            member:PrintToPlayer("Lady Lilith, Oh how you underestimate me!", 4, "Lady Lilith") --4: MESSAGE_PARTY
        end
    end
end)

trusts:addOverride("xi.globals.spells.trust.aamr.onSpellCast", function(caster, target, spell)
   
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

local trustToReplaceName = "selh_teus"

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onSpellCast", trustToReplaceName), function(caster, target, spell)
   
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

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onMobSpawn", trustToReplaceName), function(mob)
    for _, member in ipairs(mob:getMaster():getParty()) do
        if member:isPC() then
            member:PrintToPlayer("If you are prepared to fight, then I shall stand with you against the world's end.", 4, "Selh'teus") -- 4: MESSAGE_PARTY
        end
    end
end)

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onMobDespawn", trustToReplaceName), function(mob)
    local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:PrintToPlayer("Farewell, I will watch over your human world...your Vana'diel...", 4, "Selh'teus") -- 4: MESSAGE_PARTY
        end
    end
end)

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onMobDeath", trustToReplaceName), function(mob)
    local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:PrintToPlayer("The darkness...turns to void...", 4, "Selh'teus") -- 4: MESSAGE_PARTY
	  end
    end
end)

local trustToReplaceName = "aatt"

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onSpellCast", trustToReplaceName), function(caster, target, spell)
   
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

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onMobSpawn", trustToReplaceName), function(mob)
    for _, member in ipairs(mob:getMaster():getParty()) do
        if member:isPC() then
            member:PrintToPlayer("Warui suraimu janai yo!", 4, "Rimuru") -- 4: MESSAGE_PARTY
        end
    end
end)

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onMobDespawn", trustToReplaceName), function(mob)
    local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:PrintToPlayer("As you have just learned through experience, I am strong!", 4, "Rimuru") -- 4: MESSAGE_PARTY
        end
    end
end)

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onMobDeath", trustToReplaceName), function(mob)
    local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:PrintToPlayer("I underestimated you, but not as much as you underestimated me.", 4, "Rimuru") -- 4: MESSAGE_PARTY
	  end
    end
end)

local trustToReplaceName = "rughadjeen"

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onSpellCast", trustToReplaceName), function(caster, target, spell)
   
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

    trust:setLocalVar("MASTER_ID", trust:getMaster():getID())
end)

local trustToReplaceName = "brygid"

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onSpellCast", trustToReplaceName), function(caster, target, spell)
   
    local trust = caster:spawnTrust(spell:getID())

    trust:setModelId(2445) -- Trust: Rimuru
    trust:renameEntity("Mini Maw")

	trust:addStatusEffectEx(xi.effect.COLURE_ACTIVE, xi.effect.COLURE_ACTIVE, 6, 3, 0, 1, 150, xi.auraTarget.ALLIES, xi.effectFlag.AURA)
    mob:SetAutoAttackEnabled(false)

end)

local trustToReplaceName = "rahal"

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onSpellCast", trustToReplaceName), function(caster, target, spell)
   
    local trust = caster:spawnTrust(spell:getID())

    trust:setModelId(799)
    trust:renameEntity("Kam'lanaut")

	trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.FLASH, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.FLASH)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.RAMPART)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.PALISADE, ai.r.JA, ai.s.SPECIFIC, xi.ja.PALISADE)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.SENTINEL, ai.r.JA, ai.s.SPECIFIC, xi.ja.SENTINEL)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_WS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SHIELD_BASH)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_MS, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SHIELD_BASH)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.READYING_JA, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SHIELD_BASH)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.CASTING_MA, 0, ai.r.JA, ai.s.SPECIFIC, xi.ja.SHIELD_BASH)
	trust:setTrustTPSkillSettings(ai.tp.ASAP, ai.s.RANDOM)
	
	local power = trust:getMainLvl()
    trust:addMod(xi.mod.MATT, power)
    trust:addMod(xi.mod.MACC, power)
	trust:addMod(xi.mod.DEF, power*5)
	trust:addMod(xi.mod.MDEF, power*5)
	trust:addMod(xi.mod.ATT, power*8)
	trust:addMod(xi.mod.ACC, power*8)
	trust:addMod(xi.mod.DMG, -2500)
    trust:addMod(xi.mod.ALL_WSDMG_ALL_HITS, power)
    trust:addMod(xi.mod.WSACC, power*3)
	trust:addMod(xi.mod.SHIELDBLOCKRATE, power)
	trust:addMod(xi.mod.ABSORB_DMG_TO_MP, 10)
	trust:addMod(xi.mod.FASTCAST, power/2)
	trust:addMod(xi.mod.ENMITY, 2000)
    trust:addStatusEffect(xi.effect.ENLIGHT, 50, 3, 0)
	
    trust:setLocalVar("MASTER_ID", trust:getMaster():getID())	
end)

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onMobSpawn", trustToReplaceName), function(mob)
    for _, member in ipairs(mob:getMaster():getParty()) do
        if member:isPC() then
            member:PrintToPlayer("This world is nothing but a grave and you are the maggots that squirm through the rotting corpse.", 4, "Kam'lanaut") -- 4: MESSAGE_PARTY
        end
    end
end)

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onMobDespawn", trustToReplaceName), function(mob)
    local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:PrintToPlayer("*claps slowly* Quite an interesting show you put on.", 4, "Kam'lanaut") -- 4: MESSAGE_PARTY
        end
    end
end)

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onMobDeath", trustToReplaceName), function(mob)
    local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:PrintToPlayer("Etch this moment, now, deep in your hearts and minds! For victory belongs to us, the children of Altana!", 4, "Kam'lanaut") -- 4: MESSAGE_PARTY
	  end
    end
end)

local trustToReplaceName = "kuyin_hathdenna"

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onSpellCast", trustToReplaceName), function(caster, target, spell)
   
    local trust = caster:spawnTrust(spell:getID())

    trust:setModelId(3119)
    trust:renameEntity("Cornelia")

    local boostAmount = math.ceil((30 / 99) * caster:getMainLvl())
    trust:addStatusEffectEx(xi.effect.GEO_HASTE, xi.effect.GEO_HASTE, 16, 3, 0, xi.effect.GEO_HASTE, boostAmount, xi.auraTarget.ALLIES, xi.effectFlag.AURA)
    trust:addStatusEffectEx(xi.effect.GEO_ACCURACY_BOOST, xi.effect.GEO_ACCURACY_BOOST, 16, 3, 0, xi.effect.GEO_ACCURACY_BOOST, boostAmount, xi.auraTarget.ALLIES, xi.effectFlag.AURA)
    trust:addStatusEffectEx(xi.effect.GEO_MAGIC_ACC_BOOST, xi.effect.GEO_MAGIC_ACC_BOOST, 16, 3, 0, xi.effect.GEO_MAGIC_ACC_BOOST, boostAmount, xi.auraTarget.ALLIES, xi.effectFlag.AURA)
    

    trust:SetAutoAttackEnabled(false)
    trust:setUnkillable(true)

    trust:setLocalVar("MASTER_ID", trust:getMaster():getID())
end)

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onMobSpawn", trustToReplaceName), function(mob)
    for _, member in ipairs(mob:getMaster():getParty()) do
        if member:isPC() then
            member:PrintToPlayer("Cornelia, at your service.", 4, "Cornelia") -- 4: MESSAGE_PARTY
        end
    end
end)

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onMobDespawn", trustToReplaceName), function(mob)
    local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:PrintToPlayer("Remember: never give up!", 4, "Cornelia") -- 4: MESSAGE_PARTY
        end
    end
end)

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onMobDeath", trustToReplaceName), function(mob)
    local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:PrintToPlayer("The opposite of boredom is not pleasure, but excitement. People will gladly seek out any kind of excitement, even pain.", 4, "Cornelia") -- 4: MESSAGE_PARTY
	  end
    end
end)

local trustToReplaceName = "monberaux"

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onSpellCast", trustToReplaceName), function(caster, target, spell)
   
    local trust = caster:spawnTrust(spell:getID())

    trust:setModelId(2159)
    trust:renameEntity("Cait Sith")


    local boostAmount = math.ceil((30 / 99) * caster:getMainLvl())

    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 25, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.CURE)
    trust:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, xi.effect.AFFLATUS_SOLACE, ai.r.JA, ai.s.SPECIFIC, xi.ja.AFFLATUS_SOLACE)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 3, ai.r.JA, ai.s.SPECIFIC, xi.ja.BENEDICTION)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.PROTECT, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.PROTECTRA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.NOT_STATUS, xi.effect.SHELL, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.SHELLRA)
    trust:addSimpleGambit(ai.t.MELEE, ai.c.NOT_STATUS, xi.effect.HASTE, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.HASTE)
    trust:addSimpleGambit(ai.t.TARGET, ai.c.NOT_STATUS, xi.effect.EVASION_DOWN, ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.DISTRACT, 60)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SLEEP_I, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SLEEP_II, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.CURE)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.PARALYSIS, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.PARALYNA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.SILENCE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.SILENA)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS, xi.effect.PETRIFICATION, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STONA)
    trust:addSimpleGambit(ai.t.SELF, ai.c.STATUS_FLAG, xi.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ERASE)
    trust:addSimpleGambit(ai.t.PARTY, ai.c.STATUS_FLAG, xi.effectFlag.ERASABLE, ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ERASE)
    trust:SetAutoAttackEnabled(false)


    local power = trust:getMainLvl()
	trust:addMod(xi.mod.DEF, power*3)
	trust:addMod(xi.mod.MACC, power)
	trust:addMod(xi.mod.MDEF, power*5)
	trust:addMod(xi.mod.REFRESH, 50)
    trust:addMod(xi.mod.CURE_CAST_TIME, power)
	trust:addMod(xi.mod.CURE_POTENCY, power*5)

    trust:setLocalVar("MASTER_ID", trust:getMaster():getID())	
end)

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onMobSpawn", trustToReplaceName), function(mob)
    for _, member in ipairs(mob:getMaster():getParty()) do
        if member:isPC() then
            member:PrintToPlayer("There's plenty of stuffed toys like my body around, but there's only one me!", 4, "Cait Sith") -- 4: MESSAGE_PARTY
        end
    end
end)

trusts:addOverride(string.format("xi.globals.spells.trust.%s.onMobDespawn", trustToReplaceName), function(mob)
    local masterId = mob:getLocalVar("MASTER_ID")
    local master = GetPlayerByID(masterId)
    for _, member in ipairs(master:getParty()) do
        if member:isPC() then
            member:PrintToPlayer("Well, everyone.. Take care of yourselves!", 4, "Cait Sith") -- 4: MESSAGE_PARTY
        end
    end
end)

trusts:addOverride("xi.globals.spells.trust.balamor.onSpellCast", function(caster, target, spell)
   
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
end)

trusts:addOverride("xi.globals.spells.trust.ayame.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())

    local power = trust:getMainLvl()
	trust:addMod(xi.mod.DEF, power)
	trust:addMod(xi.mod.MDEF, power)
	trust:addMod(xi.mod.ACC, power*9)
	trust:addMod(xi.mod.ATT, power)
    trust:addMod(xi.mod.WSACC, power*3)
end)

trusts:addOverride("xi.globals.spells.trust.zeid.onSpellCast", function(caster, target, spell)

    local trust = caster:spawnTrust(spell:getID())

    local power = trust:getMainLvl()
	trust:addMod(xi.mod.DEF, power)
	trust:addMod(xi.mod.MDEF, power)
	trust:addMod(xi.mod.ACC, power*9)
	trust:addMod(xi.mod.ATT, power)
    trust:addMod(xi.mod.WSACC, power*3)
end)

trusts:addOverride("xi.globals.spells.trust.cid.onSpellCast", function(caster, target, spell)

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

return trusts
