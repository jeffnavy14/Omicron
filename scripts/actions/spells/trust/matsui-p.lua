-----------------------------------
-- Trust: Matsui-P
-- NIN/BLM — Limited campaign trust (FFXI Producer NPC, named after Akihiko Matsui)
-- Wiki: https://ffxiclopedia.fandom.com/wiki/Trust:_Matsui-P
--
-- Behaviour summary (per wiki, not capture-verified):
--   - Traits: Dual Wield, Daken (shuriken on auto-attack), Magic Attack Bonus
--   - JAs: Innin, Sange, Futae, Issekigan
--   - Prefers to OPEN skillchains (master's last WS, highest-tier resonance)
--   - Magic-bursts SCs twice: Ninjutsu first, tier-1 BLM second (MP permitting)
--   - Pre-engage self-buffs (Issekigan, Sange, Utsusemi) and target debuffs (Aisha)
--   - Reactive Stun on enemy mid-cast
--   - Drains/Aspirs to recover HP/MP when low
--   - Out-of-MB rotation: Ni-tier elemental Ninjutsu + tier-1 BLM
--
-- TODO: NOT CAPTURE-VERIFIED. Daken trait approximated via xi.mod.DAKEN; Sange JA
--       fired even though trusts don't model shuriken ammo (engine no-op if invalid).
-----------------------------------
---@type TSpellTrust
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return xi.trust.canCast(caster, spell)
end

spellObject.onSpellCast = function(caster, target, spell)
    return xi.trust.spawn(caster, spell)
end

spellObject.onMobSpawn = function(mob)
    xi.trust.teamworkMessage(mob, {})

    -----------------------------------
    -- Traits — Dual Wield, Daken, Magic Attack Bonus
    -----------------------------------
    mob:addMod(xi.mod.MATT,       xi.trust.modGrowthValMax(mob, 30))
    mob:addMod(xi.mod.MACC,       xi.trust.modGrowthValMax(mob, 30))
    mob:addMod(xi.mod.DUAL_WIELD, 35) -- DW5 (NIN 65+)
    mob:addMod(xi.mod.DAKEN,      30) -- 30% chance to throw shuriken on auto-attack
	mob:setMod(xi.mod.ATT, 120)
    mob:setMod(xi.mod.ACC, 3600)
	mob:setMod(xi.mod.MDEF, 100)
    mob:setMod(xi.mod.MEVA, 900)
    mob:setMod(xi.mod.EVA, 250)
    mob:addMod(xi.mod.MACC, 3600)
    mob:setMod(xi.mod.MATT, 150)
    mob:addMod(xi.mod.WSACC, 3600)
	mob:setMod(xi.mod.DOUBLE_ATTACK, 40)
    mob:setMod(xi.mod.TRIPLE_ATTACK, 15)

    -----------------------------------
    -- Self buffs (start of combat)
    -----------------------------------
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, xi.effect.ISSEKIGAN  }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.ISSEKIGAN })
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, xi.effect.SANGE      }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.SANGE })
    mob:addGambit(ai.t.SELF, { ai.c.NOT_STATUS, xi.effect.COPY_IMAGE }, { ai.r.MA, ai.s.HIGHEST,  xi.magic.spellFamily.UTSUSEMI })

    -----------------------------------
    -- Reactive Stun on caster mid-spell
    -----------------------------------
    mob:addGambit(ai.t.TARGET, { ai.c.CASTING_MA, 0 }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.STUN }, 30)

    -----------------------------------
    -- Target debuffs
    -----------------------------------
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_STATUS, xi.effect.MAGIC_ACC_DOWN }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.AISHA_ICHI }, 60)

    -----------------------------------
    -- Resource recovery — Aspir on low MP, Drain on low HP
    -----------------------------------
    mob:addGambit(ai.t.SELF,   { ai.c.MPP_LT, 30 }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.ASPIR }, 30)
    mob:addGambit(ai.t.TARGET, { ai.c.HPP_LT, 50 }, { ai.r.MA, ai.s.SPECIFIC, xi.magic.spell.DRAIN }, 60)

    -----------------------------------
    -- Magic burst x2 — Ninjutsu first, tier-1 BLM second
    -- Engine resolves families on separate MB windows.
    -----------------------------------
    mob:addGambit(ai.t.TARGET, { ai.c.MB_AVAILABLE, 0 }, { ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.KATON  })
    mob:addGambit(ai.t.TARGET, { ai.c.MB_AVAILABLE, 0 }, { ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.HYOTON })
    mob:addGambit(ai.t.TARGET, { ai.c.MB_AVAILABLE, 0 }, { ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.HUTON  })
    mob:addGambit(ai.t.TARGET, { ai.c.MB_AVAILABLE, 0 }, { ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.DOTON  })
    mob:addGambit(ai.t.TARGET, { ai.c.MB_AVAILABLE, 0 }, { ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.RAITON })
    mob:addGambit(ai.t.TARGET, { ai.c.MB_AVAILABLE, 0 }, { ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.SUITON })
    mob:addGambit(ai.t.TARGET, { ai.c.MB_AVAILABLE, 0 }, { ai.r.MA, ai.s.MB_ELEMENT, xi.magic.spellFamily.NONE   })

    -----------------------------------
    -- Out-of-MB nuking — Ni-tier ninjutsu preferred, then tier-1 BLM
    -----------------------------------
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_SC_AVAILABLE, 0 }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.KATON  }, 30)
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_SC_AVAILABLE, 0 }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.HYOTON }, 30)
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_SC_AVAILABLE, 0 }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.HUTON  }, 30)
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_SC_AVAILABLE, 0 }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.RAITON }, 30)
    mob:addGambit(ai.t.TARGET, { ai.c.NOT_SC_AVAILABLE, 0 }, { ai.r.MA, ai.s.HIGHEST, xi.magic.spellFamily.NONE   }, 30)

    -----------------------------------
    -- Active job abilities mid-fight
    -----------------------------------
    mob:addGambit(ai.t.SELF, { ai.c.TP_GTE, 1000 }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.FUTAE })
    mob:addGambit(ai.t.SELF, { ai.c.HPP_LT, 50   }, { ai.r.JA, ai.s.SPECIFIC, xi.ja.INNIN })

    -----------------------------------
    -- Skillchain opener — same selector as Ayame: picks highest-tier WS that
    -- resonates with the party leader's last weapon skill.
    -----------------------------------
    mob:setTrustTPSkillSettings(ai.tp.OPENER, ai.s.SPECIAL_AYAME)
end

spellObject.onMobDespawn = function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DESPAWN)
end

spellObject.onMobDeath = function(mob)
    xi.trust.message(mob, xi.trust.messageOffset.DEATH)
end

return spellObject

