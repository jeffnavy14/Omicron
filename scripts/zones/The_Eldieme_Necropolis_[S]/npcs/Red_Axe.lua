---------------------------------------------------------------------------------------------------
-- func: Esteban (Mimic Battle NPC)
-- desc: Starts a battle with the player's mimic in one of the predefined arenas.
---------------------------------------------------------------------------------------------------

local MIMIC_SPELL_COPY_CHANCE = 50
local MIMIC_OFFENSIVE_SPELL_COPY_CHANCE = {
    DEFAULT = 100, -- Chance for jobs not explicitly listed to have their offensive spells copied back
    [xi.job.WHM] = 50,
    [xi.job.BLM] = 50,
    [xi.job.BRD] = 50,
    [xi.job.SMN] = 50,
    [xi.job.SCH] = 50,
    [xi.job.GEO] = 50,
    [xi.job.BLU] = 20,
}
local MIMIC_TIME_LIMIT = 15 -- Time limit in minutes for the mimic battle
local MAX_STAT_INCREASE_PERCENT = 20 -- Maximum allowed % increase in core stats before engaging
local MIMIC_USE_WEAPONSKILLS = true -- Set to false to disable the mimic from using weaponskills
local MIMIC_JP_COST = 0 -- Job Point cost to battle the mimic

local mimicHP = {
    [xi.job.WAR] = 55000,
    [xi.job.MNK] = 55000,
    [xi.job.WHM] = 55000,
    [xi.job.BLM] = 55000,
    [xi.job.RDM] = 55000,
    [xi.job.THF] = 55000,
    [xi.job.PLD] = 55000,
    [xi.job.DRK] = 100000,
    [xi.job.BST] = 55000,
    [xi.job.BRD] = 55000,
    [xi.job.RNG] = 55000,
    [xi.job.SAM] = 55000,
    [xi.job.NIN] = 55000,
    [xi.job.DRG] = 55000,
    [xi.job.SMN] = 55000,
    [xi.job.BLU] = 55000,
    [xi.job.COR] = 55000,
    [xi.job.PUP] = 55000,
    [xi.job.DNC] = 55000,
    [xi.job.SCH] = 55000,
    [xi.job.GEO] = 55000,
    [xi.job.RUN] = 55000,
}

local mimicWSCooldowns = {
    [xi.job.WAR] = { min = 5, max = 10 },
    [xi.job.MNK] = { min = 5, max = 10 },
    [xi.job.WHM] = { min = 5, max = 10 },
    [xi.job.BLM] = { min = 5, max = 10 },
    [xi.job.RDM] = { min = 5, max = 10 },
    [xi.job.THF] = { min = 5, max = 10 },
    [xi.job.PLD] = { min = 5, max = 10 },
    [xi.job.DRK] = { min = 5, max = 10 },
    [xi.job.BST] = { min = 5, max = 10 },
    [xi.job.BRD] = { min = 5, max = 10 },
    [xi.job.RNG] = { min = 5, max = 10 },
    [xi.job.SAM] = { min = 5, max = 10 },
    [xi.job.NIN] = { min = 5, max = 10 },
    [xi.job.DRG] = { min = 5, max = 10 },
    [xi.job.SMN] = { min = 5, max = 10 },
    [xi.job.BLU] = { min = 5, max = 10 },
    [xi.job.COR] = { min = 5, max = 10 },
    [xi.job.PUP] = { min = 5, max = 10 },
    [xi.job.DNC] = { min = 5, max = 10 },
    [xi.job.SCH] = { min = 5, max = 10 },
    [xi.job.GEO] = { min = 5, max = 10 },
    [xi.job.RUN] = { min = 5, max = 10 },
}

local mimicWSDamage = {
    [xi.job.WAR] = {min=500, max=500}, [xi.job.MNK] = {min=500, max=500}, [xi.job.WHM] = {min=500, max=500},
    [xi.job.BLM] = {min=500, max=500}, [xi.job.RDM] = {min=500, max=500}, [xi.job.THF] = {min=500, max=500},
    [xi.job.PLD] = {min=500, max=500}, [xi.job.DRK] = {min=500, max=500}, [xi.job.BST] = {min=500, max=500},
    [xi.job.BRD] = {min=500, max=500}, [xi.job.RNG] = {min=500, max=500}, [xi.job.SAM] = {min=500, max=500},
    [xi.job.NIN] = {min=500, max=500}, [xi.job.DRG] = {min=500, max=500}, [xi.job.SMN] = {min=500, max=500},
    [xi.job.BLU] = {min=500, max=500}, [xi.job.COR] = {min=500, max=500}, [xi.job.PUP] = {min=500, max=500},
    [xi.job.DNC] = {min=500, max=500}, [xi.job.SCH] = {min=500, max=500}, [xi.job.GEO] = {min=500, max=500},
    [xi.job.RUN] = {min=500, max=500},
}

local bluBuffSpells = {
    xi.magic.spell.COCOON,
    xi.magic.spell.REFUELING,
    xi.magic.spell.METALLIC_BODY,
    xi.magic.spell.MAGIC_BARRIER,
    xi.magic.spell.PLASMA_CHARGE,
    xi.magic.spell.NATURES_MEDITATION,
    xi.magic.spell.ZEPHYR_MANTLE,
    xi.magic.spell.OCCULTATION,
    xi.magic.spell.SALINE_COAT,
    xi.magic.spell.BARRIER_TUSK,
    xi.magic.spell.DIAMONDHIDE
}

local twoHourAbilities = {
    [xi.job.WAR] = xi.jsa.MIGHTY_STRIKES_MAAT,
    [xi.job.MNK] = xi.jsa.HUNDRED_FISTS_MAAT,
    [xi.job.WHM] = xi.jsa.BENEDICTION_MAAT,
    [xi.job.BLM] = xi.jsa.MANAFONT_MAAT,
    [xi.job.RDM] = xi.jsa.CHAINSPELL_MAAT,
    [xi.job.THF] = xi.jsa.PERFECT_DODGE_MAAT,
    [xi.job.PLD] = xi.jsa.INVINCIBLE_MAAT,
    [xi.job.DRK] = xi.jsa.BLOOD_WEAPON,
    [xi.job.BST] = xi.jsa.FAMILIAR_MAAT,
    [xi.job.BRD] = xi.jsa.SOUL_VOICE_MAAT,
    [xi.job.RNG] = xi.jsa.EES_MAAT,
    [xi.job.SAM] = xi.jsa.MEIKYO_SHISUI_MAAT,
    [xi.job.NIN] = xi.jsa.MIJIN_GAKURE_MAAT,
    [xi.job.DRG] = xi.jsa.CALL_WYVERN_MAAT,
    [xi.job.SMN] = xi.jsa.ASTRAL_FLOW_MAAT,
    [xi.job.BLU] = xi.jsa.AZURE_LORE,
    [xi.job.COR] = xi.jsa.WILD_CARD,
    [xi.job.PUP] = xi.jsa.OVERDRIVE,
    [xi.job.DNC] = xi.jsa.TRANCE,
    [xi.job.SCH] = xi.jsa.TABULA_RASA,
    [xi.job.GEO] = xi.jsa.BOLSTER,
}

local abilityCategories = {
    twoHour = {
        [xi.jobAbility.MIGHTY_STRIKES] = true, [xi.jobAbility.BRAZEN_RUSH] = true,
        [xi.jobAbility.HUNDRED_FISTS] = true, [xi.jobAbility.INNER_STRENGTH] = true,
        [xi.jobAbility.BENEDICTION] = true, [xi.jobAbility.ASYLUM] = true,
        [xi.jobAbility.MANAFONT] = true, [xi.jobAbility.SUBTLE_SORCERY] = true,
        [xi.jobAbility.CHAINSPELL] = true, [xi.jobAbility.STYMIE] = true,
        [xi.jobAbility.PERFECT_DODGE] = true, [xi.jobAbility.LARCENY] = true,
        [xi.jobAbility.INVINCIBLE] = true, [xi.jobAbility.INTERVENE] = true,
        [xi.jobAbility.BLOOD_WEAPON] = true, [xi.jobAbility.SOUL_ENSLAVEMENT] = true,
        [xi.jobAbility.FAMILIAR] = true, [xi.jobAbility.UNLEASH] = true,
        [xi.jobAbility.SOUL_VOICE] = true, [xi.jobAbility.CLARION_CALL] = true,
        [xi.jobAbility.EAGLE_EYE_SHOT] = true, [xi.jobAbility.OVERKILL] = true,
        [xi.jobAbility.MEIKYO_SHISUI] = true, [xi.jobAbility.YAEGASUMI] = true,
        [xi.jobAbility.MIJIN_GAKURE] = true, [xi.jobAbility.MIKAGE] = true,
        [xi.jobAbility.SPIRIT_SURGE] = true, [xi.jobAbility.FLY_HIGH] = true,
        [xi.jobAbility.ASTRAL_FLOW] = true, [xi.jobAbility.ASTRAL_CONDUIT] = true,
        [xi.jobAbility.AZURE_LORE] = true, [xi.jobAbility.UNBRIDLED_WISDOM] = true,
        [xi.jobAbility.WILD_CARD] = true, [xi.jobAbility.CUTTING_CARDS] = true,
        [xi.jobAbility.OVERDRIVE] = true, [xi.jobAbility.HEADY_ARTIFICE] = true,
        [xi.jobAbility.TRANCE] = true, [xi.jobAbility.GRAND_PAS] = true,
        [xi.jobAbility.TABULA_RASA] = true, [xi.jobAbility.CAPER_EMISSARIUS] = true,
        [xi.jobAbility.BOLSTER] = true, [xi.jobAbility.WIDENED_COMPASS] = true,
        [xi.jobAbility.ELEMENTAL_SFORZO] = true, [xi.jobAbility.ODYLLIC_SUBTERFUGE] = true,
    },
    offensive = {
        [xi.jobAbility.JUMP] = true, [xi.jobAbility.HIGH_JUMP] = true,
        [xi.jobAbility.SUPER_JUMP] = true, [xi.jobAbility.WEAPON_BASH] = true,
        [xi.jobAbility.CHI_BLAST] = true, [xi.jobAbility.MUG] = true,
        [xi.jobAbility.SNEAK_ATTACK] = true, [xi.jobAbility.TRICK_ATTACK] = true,
        [xi.jobAbility.SHARPSHOT] = true, [xi.jobAbility.BARRAGE] = true,
        [xi.jobAbility.ASSAULT] = true, [xi.jobAbility.QUICK_DRAW] = true,
        [xi.jobAbility.FIRE_SHOT] = true, [xi.jobAbility.ICE_SHOT] = true,
        [xi.jobAbility.WIND_SHOT] = true, [xi.jobAbility.EARTH_SHOT] = true,
        [xi.jobAbility.THUNDER_SHOT] = true, [xi.jobAbility.WATER_SHOT] = true,
        [xi.jobAbility.LIGHT_SHOT] = true, [xi.jobAbility.DARK_SHOT] = true,
        [xi.jobAbility.STEALTH_SHOT] = true, [xi.jobAbility.FLASHY_SHOT] = true,
        [xi.jobAbility.SANGE] = true, [xi.jobAbility.BLADE_BASH] = true,
        [xi.jobAbility.SMITING_BREATH] = true, [xi.jobAbility.LUNGE] = true,
        [xi.jobAbility.SWIPE] = true,
    },
    defensive = {
        [xi.jobAbility.DEFENDER] = true, [xi.jobAbility.DODGE] = true,
        [xi.jobAbility.CHAKRA] = true, [xi.jobAbility.COUNTERSTANCE] = true,
        [xi.jobAbility.SHIELD_BASH] = true, [xi.jobAbility.SENTINEL] = true,
        [xi.jobAbility.COVER] = true, [xi.jobAbility.RAMPART] = true,
        [xi.jobAbility.THIRD_EYE] = true, [xi.jobAbility.PERFECT_DEFENSE] = true,
        [xi.jobAbility.MANA_WALL] = true, [xi.jobAbility.PERFECT_COUNTER] = true,
        [xi.jobAbility.PFLUG] = true, [xi.jobAbility.VALLATION] = true,
        [xi.jobAbility.VALIANCE] = true, [xi.jobAbility.LIEMENT] = true,
        [xi.jobAbility.BATTUTA] = true, [xi.jobAbility.RAYKE] = true,
        [xi.jobAbility.ONE_FOR_ALL] = true, [xi.jobAbility.RESTORING_BREATH] = true,
        [xi.jobAbility.INNER_STRENGTH] = true, [xi.jobAbility.ASYLUM] = true,
        [xi.jobAbility.INTERVENE] = true,
    },
    buff = {
        [xi.jobAbility.BERSERK] = true, [xi.jobAbility.WARCRY] = true,
        [xi.jobAbility.AGGRESSOR] = true, [xi.jobAbility.FOCUS] = true,
        [xi.jobAbility.BOOST] = true, [xi.jobAbility.LAST_RESORT] = true,
        [xi.jobAbility.FLEE] = true, [xi.jobAbility.HIDE] = true,
        [xi.jobAbility.MEDITATE] = true, [xi.jobAbility.DIVINE_SEAL] = true,
        [xi.jobAbility.ELEMENTAL_SEAL] = true, [xi.jobAbility.CONVERT] = true,
        [xi.jobAbility.HASTE_SAMBA] = true, [xi.jobAbility.DRAIN_SAMBA] = true,
        [xi.jobAbility.DRAIN_SAMBA_II] = true, [xi.jobAbility.DRAIN_SAMBA_III] = true,
        [xi.jobAbility.ASPIR_SAMBA] = true, [xi.jobAbility.ASPIR_SAMBA_II] = true,
        [xi.jobAbility.CURING_WALTZ] = true, [xi.jobAbility.CURING_WALTZ_II] = true,
        [xi.jobAbility.CURING_WALTZ_III] = true, [xi.jobAbility.CURING_WALTZ_IV] = true,
        [xi.jobAbility.CURING_WALTZ_V] = true, [xi.jobAbility.DIVINE_WALTZ] = true,
        [xi.jobAbility.DIVINE_WALTZ_II] = true, [xi.jobAbility.HEALING_WALTZ] = true,
        [xi.jobAbility.SPECTRAL_JIG] = true, [xi.jobAbility.CHOCOBO_JIG] = true,
        [xi.jobAbility.LIGHT_ARTS] = true, [xi.jobAbility.DARK_ARTS] = true,
        [xi.jobAbility.COMPOSURE] = true, [xi.jobAbility.SWORDPLAY] = true,
        [xi.jobAbility.EMBOLDEN] = true, [xi.jobAbility.REWARD] = true,
    },
    debuff = {
        [xi.jobAbility.PROVOKE] = true, [xi.jobAbility.QUICKSTEP] = true,
        [xi.jobAbility.BOX_STEP] = true, [xi.jobAbility.STUTTER_STEP] = true,
        [xi.jobAbility.FEATHER_STEP] = true, [xi.jobAbility.ANIMATED_FLOURISH] = true,
        [xi.jobAbility.DESPERATE_FLOURISH] = true, [xi.jobAbility.VIOLENT_FLOURISH] = true,
        [xi.jobAbility.TOMAHAWK] = true, [xi.jobAbility.ANGON] = true,
        [xi.jobAbility.FEINT] = true, [xi.jobAbility.FERAL_HOWL] = true,
        [xi.jobAbility.SABOTEUR] = true,
    }
}

local rdmChainspellSpells = {
    { id = xi.magic.spell.FIRE_III, delay = 4, targetSelf = false },
    { id = xi.magic.spell.BLIZZARD_III, delay = 4, targetSelf = false },
    { id = xi.magic.spell.AERO_III, delay = 4, targetSelf = false },
    { id = xi.magic.spell.STONE_III, delay = 4, targetSelf = false },
    { id = xi.magic.spell.THUNDER_III, delay = 4, targetSelf = false },
    { id = xi.magic.spell.WATER_III, delay = 4, targetSelf = false },
    { id = xi.magic.spell.CURE_IV, delay = 3, targetSelf = true },
    { id = xi.magic.spell.DISPEL, delay = 3, targetSelf = false },
}

local bluReactions = {
    twoHour = {
        { id = xi.magic.spell.MIGHTY_GUARD, targetSelf = true },
        { id = xi.magic.spell.TOURBILLION, targetSelf = false },
        { id = xi.magic.spell.BILGESTORM, targetSelf = false },
        { id = xi.magic.spell.BLOODRAKE, targetSelf = false },
    },
    offensive = {
        { id = xi.magic.spell.METALLIC_BODY, targetSelf = true },
        { id = xi.magic.spell.OCCULTATION, targetSelf = true },
        { id = xi.magic.spell.ZEPHYR_MANTLE, targetSelf = true },
        { id = xi.magic.spell.SUDDEN_LUNGE, targetSelf = false },
        { id = xi.magic.spell.AMORPHIC_SPIKES, targetSelf = false },
    },
    defensive = {
        { id = xi.magic.spell.SINKER_DRILL, targetSelf = false },
        { id = xi.magic.spell.TENEBRAL_CRUSH, targetSelf = false },
        { id = xi.magic.spell.SPECTRAL_FLOE, targetSelf = false },
        { id = xi.magic.spell.ENTOMB, targetSelf = false },
    },
    buff = {
        { id = xi.magic.spell.ERRATIC_FLUTTER, targetSelf = true },
        { id = xi.magic.spell.NATURES_MEDITATION, targetSelf = true },
        { id = xi.magic.spell.BARRIER_TUSK, targetSelf = true },
        { id = xi.magic.spell.SALINE_COAT, targetSelf = true },
    },
    debuff = {
        { id = xi.magic.spell.EXUVIATION, targetSelf = true },
        { id = xi.magic.spell.RESTORAL, targetSelf = true },
        { id = xi.magic.spell.WHITE_WIND, targetSelf = true },
        { id = xi.magic.spell.DELTA_THRUST, targetSelf = false },
        { id = xi.magic.spell.TENEBRAL_CRUSH, targetSelf = false },
    }
}

local function getWSDamage(mob, ws, target)
    -- 1. Perfect Dodge / Invincible Check
    if target:hasStatusEffect(xi.effect.PERFECT_DODGE) or target:hasStatusEffect(xi.effect.ALL_MISS) then
        return 0, xi.msg.basic.SKILL_MISS, 0
    end

    -- 2. Hit Rate (Accuracy vs Evasion)
    local hitRate = 0.95
    if xi.combat and xi.combat.physicalHitRate then
        hitRate = xi.combat.physicalHitRate.getPhysicalHitRate(mob, target, 0, xi.attackAnimation.RIGHT_ATTACK, false)
    end
    
    if math.random() > hitRate then
        return 0, xi.msg.basic.SKILL_MISS, 0
    end

    -- 3. Parry / Block / Guard Checks
    if xi.combat and xi.combat.physical then
        if xi.combat.physical.isParried(target, mob) then
            return 0, xi.msg.basic.PARRIED, 0
        end
    end

    local dmgRange = (ws.damage and ws.damage[mob:getMainJob()]) or mimicWSDamage[mob:getMainJob()] or {min=500, max=500}
    local finalDmg = math.random(dmgRange.min, dmgRange.max)

    if xi.combat and xi.combat.physical then
        if xi.combat.physical.isBlocked(target, mob) then
            finalDmg = finalDmg - xi.combat.physical.getDamageReductionForBlock(target, mob, finalDmg)
        end

        if xi.combat.physical.isGuarded(target, mob) then
            finalDmg = math.max(1, math.floor(finalDmg * 0.5))
        end
    end

    -- 4. Apply Standard Damage Taken Modifiers
    if target then
        local physMod    = target:getMod(xi.mod.DMGPHYS) or 0
        local dmgMod     = target:getMod(xi.mod.DMG)     or 0
        local combined   = math.max(physMod + dmgMod, -50)
        local physIIMod  = target:getMod(xi.mod.DMGPHYS_II) or 0

        finalDmg = math.max(1, math.floor(
            finalDmg * ((100 + combined) / 100) * ((100 + physIIMod) / 100)
        ))

        if utils and utils.handlePhalanx then
            finalDmg = utils.handlePhalanx(target, finalDmg)
        end
        if utils and utils.handleStoneskin then
            finalDmg = utils.handleStoneskin(target, finalDmg)
        end
    end

    -- 5. Shadow Absorption Check (Utsusemi / Blink)
    local shadowsUsed = 0
    if utils and utils.takeShadows then
        finalDmg, shadowsUsed = utils.takeShadows(target, finalDmg, ws.hits or 1)
    end

    if finalDmg == 0 and shadowsUsed > 0 then
        return 0, xi.msg.basic.SHADOW_ABSORB, shadowsUsed
    end

    return finalDmg, xi.msg.basic.DAMAGE, 0
end

local primeWeaponskillMap = {
    [xi.skill.HAND_TO_HAND] = { 
        name = "Maru Kala", 
        animationId = 25,
        hits = 2,
        execute = function(mob, target, ws)
            local finalDmg, msg, shadows = getWSDamage(mob, ws, target)
            if finalDmg > 0 then
                target:takeWeaponskillDamage(mob, finalDmg, xi.attackType.PHYSICAL, xi.damageType.HTH, xi.slot.MAIN, false, ws.hits or 1, 0, 1)
            end
            return finalDmg, msg, shadows
        end
    },
    [xi.skill.DAGGER]       = {
        name = "Ruthless Stroke",
        animationId = 41,
        hits = 4,
        execute = function(mob, target, ws)
            local finalDmg, msg, shadows = getWSDamage(mob, ws, target)
            if finalDmg > 0 then
                target:takeWeaponskillDamage(mob, finalDmg, xi.attackType.PHYSICAL, xi.damageType.PIERCING, xi.slot.MAIN, false, ws.hits or 1, 0, 1)
            end
            return finalDmg, msg, shadows
        end
    },
    [xi.skill.SWORD]        = {
        name = "Imperator",
        animationId = 12,
        hits = 1,
        execute = function(mob, target, ws)
            local finalDmg, msg, shadows = getWSDamage(mob, ws, target)
            if finalDmg > 0 then
                target:takeWeaponskillDamage(mob, finalDmg, xi.attackType.PHYSICAL, xi.damageType.SLASHING, xi.slot.MAIN, false, ws.hits or 1, 0, 1)
            end
            return finalDmg, msg, shadows
        end
    },
    [xi.skill.GREAT_SWORD]  = {
        name = "Fimbulvetr",
        animationId = 115,
        hits = 1,
        execute = function(mob, target, ws)
            local finalDmg, msg, shadows = getWSDamage(mob, ws, target)
            if finalDmg > 0 then
                target:takeWeaponskillDamage(mob, finalDmg, xi.attackType.PHYSICAL, xi.damageType.SLASHING, xi.slot.MAIN, false, ws.hits or 1, 0, 1)
            end
            return finalDmg, msg, shadows
        end
    },
    [xi.skill.AXE]          = {
        name = "Blitz",
        animationId = 55,
        hits = 5,
        execute = function(mob, target, ws)
            local finalDmg, msg, shadows = getWSDamage(mob, ws, target)
            if finalDmg > 0 then
                target:takeWeaponskillDamage(mob, finalDmg, xi.attackType.PHYSICAL, xi.damageType.SLASHING, xi.slot.MAIN, false, ws.hits or 1, 0, 1)
            end
            return finalDmg, msg, shadows
        end
    },
    [xi.skill.GREAT_AXE]    = {
        name = "Disaster",
        animationId = 100,
        hits = 1,
        execute = function(mob, target, ws)
            local finalDmg, msg, shadows = getWSDamage(mob, ws, target)
            if finalDmg > 0 then
                target:takeWeaponskillDamage(mob, finalDmg, xi.attackType.PHYSICAL, xi.damageType.SLASHING, xi.slot.MAIN, false, ws.hits or 1, 0, 1)
            end
            return finalDmg, msg, shadows
        end
    },
    [xi.skill.SCYTHE]       = {
        name = "Origin",
        animationId = 70,
        hits = 1,
        execute = function(mob, target, ws)
            local finalDmg, msg, shadows = getWSDamage(mob, ws, target)
            if finalDmg > 0 then
                target:takeWeaponskillDamage(mob, finalDmg, xi.attackType.PHYSICAL, xi.damageType.SLASHING, xi.slot.MAIN, false, ws.hits or 1, 0, 1)
            end
            return finalDmg, msg, shadows
        end
    },
    [xi.skill.POLEARM]      = {
        name = "Diarmuid",
        animationId = 130,
        hits = 2,
        execute = function(mob, target, ws)
            local finalDmg, msg, shadows = getWSDamage(mob, ws, target)
            if finalDmg > 0 then
                target:takeWeaponskillDamage(mob, finalDmg, xi.attackType.PHYSICAL, xi.damageType.PIERCING, xi.slot.MAIN, false, ws.hits or 1, 0, 1)
            end
            return finalDmg, msg, shadows
        end
    },
    [xi.skill.KATANA]       = {
        name = "Zesho Meppo",
        animationId = 160,
        hits = 4,
        execute = function(mob, target, ws)
            local finalDmg, msg, shadows = getWSDamage(mob, ws, target)
            if finalDmg > 0 then
                target:takeWeaponskillDamage(mob, finalDmg, xi.attackType.PHYSICAL, xi.damageType.SLASHING, xi.slot.MAIN, false, ws.hits or 1, 0, 1)
            end
            return finalDmg, msg, shadows
        end
    },
    [xi.skill.GREAT_KATANA] = {
        name = "Mumei",
        animationId = 175,
        hits = 1,
        execute = function(mob, target, ws)
            local finalDmg, msg, shadows = getWSDamage(mob, ws, target)
            if finalDmg > 0 then
                target:takeWeaponskillDamage(mob, finalDmg, xi.attackType.PHYSICAL, xi.damageType.SLASHING, xi.slot.MAIN, false, ws.hits or 1, 0, 1)
            end
            return finalDmg, msg, shadows
        end
    },
    [xi.skill.CLUB]         = {
        name = "Dagda",
        animationId = 86,
        hits = 2,
        execute = function(mob, target, ws)
            local finalDmg, msg, shadows = getWSDamage(mob, ws, target)
            if finalDmg > 0 then
                target:takeWeaponskillDamage(mob, finalDmg, xi.attackType.PHYSICAL, xi.damageType.BLUNT, xi.slot.MAIN, false, ws.hits or 1, 0, 1)
            end
            return finalDmg, msg, shadows
        end
    },
    [xi.skill.STAFF]        = {
        name = "Oshala",
        animationId = 145,
        hits = 1,
        execute = function(mob, target, ws)
            local finalDmg, msg, shadows = getWSDamage(mob, ws, target)
            if finalDmg > 0 then
                target:takeWeaponskillDamage(mob, finalDmg, xi.attackType.PHYSICAL, xi.damageType.BLUNT, xi.slot.MAIN, false, ws.hits or 1, 0, 1)
            end
            return finalDmg, msg, shadows
        end
    },
    [xi.skill.ARCHERY]      = {
        name = "Sarv",
        animationId = 225,
        hits = 1,
        execute = function(mob, target, ws)
            local finalDmg, msg, shadows = getWSDamage(mob, ws, target)
            if finalDmg > 0 then
                target:takeWeaponskillDamage(mob, finalDmg, xi.attackType.RANGED, xi.damageType.PIERCING, xi.slot.RANGED, false, ws.hits or 1, 0, 1)
            end
            return finalDmg, msg, shadows
        end
    },
    [xi.skill.MARKSMANSHIP] = {
        name = "Terminus",
        animationId = 226,
        hits = 1,
        execute = function(mob, target, ws)
            local finalDmg, msg, shadows = getWSDamage(mob, ws, target)
            if finalDmg > 0 then
                target:takeWeaponskillDamage(mob, finalDmg, xi.attackType.RANGED, xi.damageType.PIERCING, xi.slot.RANGED, false, ws.hits or 1, 0, 1)
            end
            return finalDmg, msg, shadows
        end
    },
}

--In Mog Garden:
--Arenas
--mimic: 281.856, 0.3000, -591.8783, rot 0
--player: -289.8336, 0.2176, -591.8783 rot 127

--Battlestarter
--Name: Prime Battle
--Look:01000803A4109621A430A440A4505063A8700000
--301.3116, 0.0277, -584.9202, rot 96

local arenas = {
    [1] = { 
        player = { x = 309.7904, y = -27.7100, z = 20.0612 , rot = 0 },
        mimic  = { x = 314.6903, y = -27.7100, z = 20.1024, rot = 127 }
    },
}

local jobNames = {
    [xi.job.WAR] = "WAR", [xi.job.MNK] = "MNK", [xi.job.WHM] = "WHM",
    [xi.job.BLM] = "BLM", [xi.job.RDM] = "RDM", [xi.job.THF] = "THF",
    [xi.job.PLD] = "PLD", [xi.job.DRK] = "DRK", [xi.job.BST] = "BST",
    [xi.job.BRD] = "BRD", [xi.job.RNG] = "RNG", [xi.job.SAM] = "SAM",
    [xi.job.NIN] = "NIN", [xi.job.DRG] = "DRG", [xi.job.SMN] = "SMN",
    [xi.job.BLU] = "BLU", [xi.job.COR] = "COR", [xi.job.PUP] = "PUP",
    [xi.job.DNC] = "DNC", [xi.job.SCH] = "SCH", [xi.job.GEO] = "GEO",
    [xi.job.RUN] = "RUN",
}

local weaponNames = {
    [xi.skill.HAND_TO_HAND] = "Hand-to-Hand",
    [xi.skill.DAGGER] = "Dagger",
    [xi.skill.SWORD] = "Sword",
    [xi.skill.GREAT_SWORD] = "Great Sword",
    [xi.skill.AXE] = "Axe",
    [xi.skill.GREAT_AXE] = "Great Axe",
    [xi.skill.SCYTHE] = "Scythe",
    [xi.skill.POLEARM] = "Polearm",
    [xi.skill.KATANA] = "Katana",
    [xi.skill.GREAT_KATANA] = "Great Katana",
    [xi.skill.CLUB] = "Club",
    [xi.skill.STAFF] = "Staff",
    [xi.skill.ARCHERY] = "Archery",
    [xi.skill.MARKSMANSHIP] = "Marksmanship",
}

local weaponKeys = {
    xi.skill.HAND_TO_HAND, xi.skill.DAGGER, xi.skill.SWORD, xi.skill.GREAT_SWORD,
    xi.skill.AXE, xi.skill.GREAT_AXE, xi.skill.SCYTHE, xi.skill.POLEARM,
    xi.skill.KATANA, xi.skill.GREAT_KATANA, xi.skill.CLUB, xi.skill.STAFF,
    xi.skill.ARCHERY, xi.skill.MARKSMANSHIP
}

local function SetServerVariableString(varName, str)
    if not str then return end
    SetServerVariable(varName .. "_Len", #str)
    for i = 1, #str do
        SetServerVariable(varName .. "_C" .. i, string.byte(str, i))
    end
end

local function GetServerVariableString(varName)
    local len = GetServerVariable(varName .. "_Len")
    if len == 0 then return "" end
    local str = ""
    for i = 1, len do
        local char = GetServerVariable(varName .. "_C" .. i)
        if char > 0 then str = str .. string.char(char) end
    end
    return str
end

local function delaySendMenu(player, menu)
    player:timer(50, function(p)
        p:customMenu(menu)
    end)
end

local function toHexU16(val, slotOffset)
    val = tonumber(val) or 0
    if slotOffset then
        val = bit.bor(val, bit.lshift(slotOffset, 12))
    end
    return string.format("%02X%02X", bit.band(val, 0xFF), bit.rshift(val, 8))
end

local function toHexU8(val)
    val = tonumber(val) or 0
    return string.format("%02X", bit.band(val, 0xFF))
end

local function lookTableToHex(look, entity)
    if not look then return string.rep("0", 40) end
    
    if look[1] ~= nil and #look >= 20 then
        local hex = ""
        for i = 1, 20 do
            local val = look[i]
            if entity and entity:isPC() then
                if i == 3 then
                    pcall(function() val = entity:getFace() end)
                elseif i == 4 then
                    pcall(function() val = entity:getRace() end)
                end
            end
            hex = hex .. toHexU8(val)
        end
        return hex
    end

    local modelId = look.model or look.modelid or 0
    local size = 1
    local face = look.face or 0
    
    if entity and entity:isPC() then 
        modelId = 1 
        pcall(function() face = entity:getFace() end)
        pcall(function() size = entity:getRace() end)
    end

    return toHexU16(modelId) ..
           toHexU8(face) ..
           toHexU8(size) ..
           toHexU16(look.head, 0) ..
           toHexU16(look.body, 1) ..
           toHexU16(look.hands, 2) ..
           toHexU16(look.legs, 3) ..
           toHexU16(look.feet, 4) ..
           toHexU16(look.main, 5) ..
           toHexU16(look.sub, 6) ..
           toHexU16(look.ranged, 7)
end

local function calculatePlayerStatSum(player)
    local sum = 0
    local coreMods = { xi.mod.STR, xi.mod.DEX, xi.mod.VIT, xi.mod.AGI, xi.mod.INT, xi.mod.MND, xi.mod.CHR }

    for _, id in ipairs(coreMods) do
        sum = sum + (player:getStat(id) or 0)
    end

    return sum
end

local function raisePlayer(p)
    if p and p:isDead() then
        p:sendRaise(3)
        local listenerId = 'MIMIC_RAISE_WEAKNESS_' .. p:getID()
        p:addListener('TICK', listenerId, function(pArg)
            if not pArg:isDead() then
                pArg:delStatusEffect(xi.effect.WEAKNESS)
                pArg:delStatusEffect(xi.effect.MEDICINE)
                pArg:timer(1000, function(p_timed)
                    p_timed:setHP(p_timed:getMaxHP())
                    p_timed:setMP(p_timed:getMaxMP())
                end)
                pArg:removeListener(listenerId)
            end
        end)
    end
end

local function startPrebuffSequence(m)
    if not m or not m:isAlive() then return end
    if m:getMainJob() ~= xi.job.BLU then return end

    if m:hasStatusEffect(xi.effect.SILENCE) or m:getCurrentAction() > 1 then
        m:timer(3000, function(mArg) startPrebuffSequence(mArg) end)
        return
    end

    local phase = m:getLocalVar('prebuffPhase')
    if phase == 1 then m:castSpell(xi.magic.spell.PLASMA_CHARGE, m); m:setLocalVar('prebuffPhase', 2)
    elseif phase == 2 then m:castSpell(xi.magic.spell.REFUELING, m); m:setLocalVar('prebuffPhase', 3)
    elseif phase == 3 then m:castSpell(xi.magic.spell.OCCULTATION, m); m:setLocalVar('prebuffPhase', 4)
    end

    if phase < 4 then
        m:timer(5000, function(mArg) startPrebuffSequence(mArg) end)
    end
end

local function spawnMimic(player, arenaIdx, confrontationID, overrideWepType)
    local arena = arenas[arenaIdx]

    player:setPos(arena.player.x, arena.player.y, arena.player.z, arena.player.rot)

    -- Wipe all existing buffs/debuffs before applying battle restrictions
    player:eraseAllStatusEffect()
    player:dispelAllStatusEffect()

    player:addStatusEffect(xi.effect.CONFRONTATION, { power = confrontationID, origin = player })
    local confEffect = player:getStatusEffect(xi.effect.CONFRONTATION)
    if confEffect then
        confEffect:delEffectFlag(xi.effectFlag.DEATH)
    end
    player:addStatusEffect(xi.effect.SJ_RESTRICTION, { origin = player })
    player:addStatusEffect(xi.effect.MAX_HP_BOOST, { power = 1000, origin = player }) -- Apply the boost
    player:setHP(player:getMaxHP()) -- Set current HP to the new maximum
    player:setCharVar("MimicBattleActive", 1)
    player:setLocalVar("MimicArena", arenaIdx)
    player:countdown(MIMIC_TIME_LIMIT * 60)

    local lookTable = player:getModelIdLook()
    local lookHex = lookTableToHex(lookTable, player)

    local tName = player:getName()
    local tJob = player:getMainJob() or 1
    local tSubJob = player:getSubJob() or 0
    local tLevel = player:getMainLvl() or 1
    if tLevel < 1 then tLevel = 1 end
    local tMaxHP = player:getMaxHP() or 100
    local tMaxMP = player:getMaxMP() or 0
    local tWeaponType = overrideWepType or player:getWeaponSkillType(xi.slot.MAIN)
    if tWeaponType == 0 or tWeaponType == xi.skill.NONE then
        tWeaponType = xi.skill.HAND_TO_HAND
    end

    local spawnMainItem = player:getEquippedItem(xi.slot.MAIN)
    local spawnMainId = spawnMainItem and spawnMainItem:getID() or 0
    local spawnSubItem = player:getEquippedItem(xi.slot.SUB)
    local spawnSubId = spawnSubItem and spawnSubItem:getID() or 0
    local spawnRangedItem = player:getEquippedItem(xi.slot.RANGED)
    local spawnRangedId = spawnRangedItem and spawnRangedItem:getID() or 0

    local coreMods = { xi.mod.STR, xi.mod.DEX, xi.mod.VIT, xi.mod.AGI, xi.mod.INT, xi.mod.MND, xi.mod.CHR }
    local derivedMods = { xi.mod.ATT, xi.mod.DEF, xi.mod.EVA, xi.mod.ACC }
    local normalMods = {
        xi.mod.RATT, xi.mod.RACC, xi.mod.MDEF, xi.mod.MEVA,
        xi.mod.MACC, xi.mod.MATT, xi.mod.MAGIC_DAMAGE, xi.mod.MAGIC_BURST_BONUS_CAPPED,
        xi.mod.DMG, xi.mod.DMGMAGIC, xi.mod.DMGMAGIC_II, xi.mod.DMGPHYS, xi.mod.DMGPHYS_II, xi.mod.DMGBREATH,
        xi.mod.DOUBLE_ATTACK, xi.mod.TRIPLE_ATTACK, xi.mod.QUAD_ATTACK,
        xi.mod.CRITHITRATE, xi.mod.CRIT_DMG_INCREASE,
        xi.mod.STORETP, xi.mod.DUAL_WIELD, xi.mod.SUBTLE_BLOW, xi.mod.SUBTLE_BLOW_II,
        xi.mod.COUNTER, xi.mod.INQUARTATA, xi.mod.FASTCAST, xi.mod.CONSERVE_MP,
        xi.mod.ALL_WSDMG_FIRST_HIT, xi.mod.ALL_WSDMG_ALL_HITS, xi.mod.WSACC, xi.mod.TP_BONUS,
        xi.mod.SAVETP, xi.mod.CONSERVE_TP, xi.mod.SKILLCHAINBONUS, xi.mod.SKILLCHAINDMG,
        xi.mod.SHIELDBLOCKRATE, xi.mod.SHIELD_MASTERY_TP, xi.mod.TACTICAL_PARRY, xi.mod.TACTICAL_GUARD, xi.mod.OCCULT_ACUMEN,
        xi.mod.QUICK_MAGIC, xi.mod.CURE_POTENCY, xi.mod.CURE_POTENCY_II, xi.mod.CURE_POTENCY_RCVD, xi.mod.WALTZ_POTENCY,
        xi.mod.HASTE_ABILITY, xi.mod.HASTE_MAGIC, xi.mod.HASTE_GEAR,
        xi.mod.FIRE_RES_RANK, xi.mod.WATER_RES_RANK, xi.mod.WIND_RES_RANK, xi.mod.EARTH_RES_RANK,
        xi.mod.ICE_RES_RANK, xi.mod.THUNDER_RES_RANK, xi.mod.DARK_RES_RANK, xi.mod.LIGHT_RES_RANK,
        xi.mod.SLEEPRES, xi.mod.POISONRES, xi.mod.PARALYZERES, xi.mod.BLINDRES,
        xi.mod.SILENCERES, xi.mod.VIRUSRES, xi.mod.PETRIFYRES, xi.mod.BINDRES,
        xi.mod.CURSERES, xi.mod.GRAVITYRES, xi.mod.SLOWRES, xi.mod.STUNRES,
        xi.mod.CHARMRES, xi.mod.AMNESIARES, xi.mod.LULLABYRES, xi.mod.DEATHRES, xi.mod.STATUSRES,
        xi.mod.REFRESH, xi.mod.REGEN, xi.mod.REGAIN, xi.mod.SPELLINTERRUPT
    }

    local tStats = {}
    for _, id in ipairs(coreMods) do tStats[id] = player:getStat(id) or 0 end
    for _, id in ipairs(derivedMods) do tStats[id] = player:getStat(id) or 0 end
    for _, id in ipairs(normalMods) do tStats[id] = player:getMod(id) or 0 end

    local spawnX = arena.mimic.x
    local spawnY = arena.mimic.y
    local spawnZ = arena.mimic.z
    local spawnRot = arena.mimic.rot

    local farX = 0
    local farY = -200
    local farZ = 0

    local zone = player:getZone()
    local mob = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = "Optimus Prime",
        look = lookHex,
        x = farX,
        y = farY,
        z = farZ,
        rotation = spawnRot,
        widescan = 0,
        groupId = 55,
        groupZoneId = 182,
        mJob = tJob,
        sJob = tSubJob,
        minLevel = tLevel,
        maxLevel = tLevel,
        releaseIdOnDisappear = true,
        specialSpawnAnimation = true,
        
        onMobSpawn = function(m)
            m:setMobMod(xi.mobMod.NO_MOVE, 1)
            m:setMobMod(xi.mobMod.NO_DROPS, 1)
            m:setMobMod(xi.mobMod.NO_SPELL_COST, 1)
            m:setDropID(0)
            m:addStatusEffect(xi.effect.REGEN, { power = 5000, duration = 0, origin = m, tick = 3 })
            m:setMod(xi.mod.UDMGPHYS, -90000)
            m:changeJob(tJob)
            m:setMobLevel(tLevel)
            
            m:updateHealth()

            local mpDiff = tMaxMP - m:getMaxMP()
            if mpDiff > 0 then m:addMod(xi.mod.MP, mpDiff) end
            
            local targetHP = mimicHP[m:getMainJob()] or 100000
            local currentHP = m:getMaxHP()
            
            if currentHP > 0 then
                local hppNeeded = math.floor(((targetHP - currentHP) / currentHP) * 100)
                if hppNeeded > 32000 then hppNeeded = 32000 end
                if hppNeeded > 0 then
                    m:addMod(xi.mod.HPP, hppNeeded)
                    m:updateHealth()
                    currentHP = m:getMaxHP()
                end
            end
            
            local flatNeeded = targetHP - currentHP
            if flatNeeded > 32000 then flatNeeded = 32000 end
            if flatNeeded > 0 then m:addMod(xi.mod.HP, flatNeeded) end
            
            m:updateHealth()
            m:setHP(m:getMaxHP())
            m:setMP(tMaxMP)

            -- Instantly aggro the player to generate enmity and block Trust casting
            m:updateEnmity(player)

            -- Immobilize the mimic until the player attacks
            m:setLocalVar("battleStarted", 0)
            m:setAutoAttackEnabled(false)
            m:setLocalVar("SpawnPlayerStatSum", calculatePlayerStatSum(player))
            m:setLocalVar("SpawnWeaponType", tWeaponType)
            m:setLocalVar("SpawnMainWep", spawnMainId)
            m:setLocalVar("SpawnSubWep", spawnSubId)
            m:setLocalVar("SpawnRangedWep", spawnRangedId)
            m:addStatusEffect(xi.effect.SILENCE, { power = 1, duration = 9999, origin = m })
            m:addStatusEffect(xi.effect.AMNESIA, { power = 1, duration = 9999, origin = m })
            m:addStatusEffect(xi.effect.BIND, { power = 1, duration = 9999, origin = m })

            local function wakeMimic(mArg)
                if mArg:getLocalVar("battleStarted") == 0 then
                    mArg:setLocalVar("battleStarted", 1)
                    mArg:setLocalVar("battleStartTime", os.time())
                    mArg:setAutoAttackEnabled(true)
                    mArg:setMobMod(xi.mobMod.NO_MOVE, 0)
                    mArg:delStatusEffect(xi.effect.SILENCE)
                    mArg:delStatusEffect(xi.effect.AMNESIA)
                    mArg:delStatusEffect(xi.effect.BIND)
                end
            end

            m:addStatusEffect(xi.effect.CONFRONTATION, { power = confrontationID, origin = m })
            m:setLocalVar("MimicListenersAdded", 0)
            m:setLocalVar("MimicTwoHourUsed", 0)
            m:setLocalVar("bluCooldown", os.time() + 15)
            m:setLocalVar("bluThreshold75", 0)
            m:setLocalVar("bluThreshold50", 0)
            m:setLocalVar("prebuffPhase", 1)
            m:setLocalVar("chainspellCooldown", 0)
            local wsCd = mimicWSCooldowns[tJob] or { min = 10, max = 20 }
            m:setLocalVar("wsCooldown", os.time() + wsCd.min)

            m:addListener('MAGIC_TAKE', "MIMIC_MAGIC_TAKE", function(targ, caster, spell)
                if targ:getLocalVar("battleStarted") == 0 and caster:isPC() then
                    wakeMimic(targ)
                end

                if spell:tookEffect() and caster:isPC() then
                local copyChance = MIMIC_OFFENSIVE_SPELL_COPY_CHANCE[tJob] or MIMIC_OFFENSIVE_SPELL_COPY_CHANCE.DEFAULT
                if math.random(1, 100) <= copyChance then
                    targ:setLocalVar('spellToMimic', spell:getID())
                    targ:setLocalVar('spellToMimicTarget', caster:getID())
                    targ:setLocalVar('castWindow', os.time() + 30)
                    targ:setLocalVar('castTime', os.time() + 5)
                end
                end
            end)

            m:addListener('WEAPONSKILL_TAKE', "MIMIC_WAKE_W", function(targ, caster, wsid)
                if caster:isPC() then wakeMimic(targ) end
            end)

            m:addListener('ABILITY_TAKE', "MIMIC_WAKE_A", function(targ, caster, ability)
                if caster:isPC() then wakeMimic(targ) end
            end)

            m:timer(3000, function(mArg) startPrebuffSequence(mArg) end)

            m:timer(MIMIC_TIME_LIMIT * 60000, function(mArg)
                if mArg:isAlive() then
                    mArg:setLocalVar("MimicFailing", 1)
                    player:printToPlayer("Time is up! You failed to defeat your Mimic.", xi.msg.channel.SYSTEM_3)
                    player:delStatusEffect(xi.effect.CONFRONTATION)
                    player:delStatusEffect(xi.effect.SJ_RESTRICTION)
                    player:delStatusEffect(xi.effect.MEDICINE)
                    player:delStatusEffect(xi.effect.MAX_HP_BOOST)
                    player:setCharVar("MimicBattleActive", 0)
                    player:countdown()
                    local listenerPrefix = "MIMIC_COPY_" .. mArg:getID()
                    player:removeListener(listenerPrefix .. "_SELF_SPELL")
                    player:removeListener(listenerPrefix .. "_JA")
                    raisePlayer(player)
                    mArg:getZone():setLocalVar("MimicArena" .. arenaIdx, 0)
                    DespawnMob(mArg:getID())
                end
            end)

            local playerID = player:getID()

            m:timer(3 * 60000, function(mArg)
                if mArg:isAlive() and mArg:getLocalVar("battleStarted") == 0 then
                    mArg:setLocalVar("MimicFailing", 1)
                    local p = GetPlayerByID(playerID)
                    if p and p:getZoneID() == mArg:getZoneID() then
                        p:printToPlayer("You failed to engage your Mimic in time.", xi.msg.channel.SYSTEM_3)
                        p:delStatusEffect(xi.effect.CONFRONTATION)
                        p:delStatusEffect(xi.effect.SJ_RESTRICTION)
                        p:delStatusEffect(xi.effect.MEDICINE)
                        p:delStatusEffect(xi.effect.MAX_HP_BOOST)
                        p:setCharVar("MimicBattleActive", 0)
                        p:countdown()
                        local listenerPrefix = "MIMIC_COPY_" .. mArg:getID()
                        p:removeListener(listenerPrefix .. "_SELF_SPELL")
                        p:removeListener(listenerPrefix .. "_JA")
                    end
                    mArg:getZone():setLocalVar("MimicArena" .. arenaIdx, 0)
                    DespawnMob(mArg:getID())
                end
            end)

            local function zoneCheck(mArg)
                if not mArg:isAlive() then return end
                local p = GetPlayerByID(playerID)
                if not p or p:getZoneID() ~= mArg:getZoneID() then
                    mArg:setLocalVar("MimicFailing", 1)
                    if p then p:setCharVar("MimicBattleActive", 0) end
                    mArg:getZone():setLocalVar("MimicArena" .. arenaIdx, 0)
                    DespawnMob(mArg:getID())
                    return
                end
                mArg:timer(5000, function(m) zoneCheck(m) end)
            end
            m:timer(5000, function(mArg) zoneCheck(mArg) end)

            m:addListener('COMBAT_TICK', "MIMIC_CTICK", function(mArg)
                local currTime = os.time()

                if mArg:getLocalVar("battleStarted") == 0 then
                    if player:isEngaged() or mArg:getHPP() < 100 then
                        wakeMimic(mArg)
                    else
                        return -- Skip combat logic while waiting
                    end
                end

                if mArg:getHPP() < 25 and mArg:getLocalVar('MimicTwoHourUsed') == 0 and mArg:getCurrentAction() <= 1 then
                    local twoHourSkill = twoHourAbilities[mArg:getMainJob()]
                    if twoHourSkill then
                        mArg:useMobAbility(twoHourSkill)
                    end
                    mArg:setLocalVar('MimicTwoHourUsed', 1)
                    return
                end
                
                if mArg:getMainJob() == xi.job.RDM and mArg:hasStatusEffect(xi.effect.CHAINSPELL) then
                    if currTime >= mArg:getLocalVar('chainspellCooldown') and mArg:getCurrentAction() <= 1 and not mArg:hasStatusEffect(xi.effect.SILENCE) then
                        local spell = rdmChainspellSpells[math.random(#rdmChainspellSpells)]
                        if spell.targetSelf and mArg:getHPP() > 80 then
                            spell = rdmChainspellSpells[math.random(1, 6)]
                        end
                        
                        local currentTarget = mArg:getTarget() or player
                        mArg:castSpell(spell.id, spell.targetSelf and mArg or currentTarget)
                        mArg:setLocalVar('chainspellCooldown', currTime + spell.delay)
                        return
                    end
                end
                
                if MIMIC_USE_WEAPONSKILLS and mArg:getTP() >= 1500 and currTime >= mArg:getLocalVar('wsCooldown') and mArg:getCurrentAction() <= 1 and not mArg:hasStatusEffect(xi.effect.AMNESIA) then
                    local primeWS = tWeaponType and primeWeaponskillMap[tWeaponType]
                    if primeWS then
                        local currentTarget = mArg:getTarget() or player
                        local cleanName = string.gsub(mArg:getName(), "DE_", "")
                        player:printToPlayer(string.format("%s readies %s", cleanName, primeWS.name), xi.msg.channel.SYSTEM_3)
                        
                        local dmg, msg, shadows = 0, xi.msg.basic.DAMAGE, 0
                        if primeWS.execute then
                            dmg, msg, shadows = primeWS.execute(mArg, currentTarget, primeWS)
                        end
                        
                        if msg == xi.msg.basic.SHADOW_ABSORB then
                            mArg:injectActionPacket(currentTarget:getID(), 3, primeWS.animationId, shadows, msg, 0, 0, mArg:getID())
                            player:printToPlayer(string.format("%s uses %s.\n%d of %s's shadows absorb the damage and disappear.", cleanName, primeWS.name, shadows, currentTarget:getName()), xi.msg.channel.SYSTEM_3)
                        elseif msg == xi.msg.basic.SKILL_MISS or msg == xi.msg.basic.PARRIED then
                            local missStr = "But misses"
                            if msg == xi.msg.basic.PARRIED then
                                if currentTarget:getID() == player:getID() then
                                    missStr = "You parry the attack"
                                else
                                    missStr = string.format("%s parries the attack", currentTarget:getName())
                                end
                            end
                            mArg:injectActionPacket(currentTarget:getID(), 3, primeWS.animationId, 0, msg, 0, 0, mArg:getID())
                            player:printToPlayer(string.format("%s uses %s.\n%s.", cleanName, primeWS.name, missStr), xi.msg.channel.SYSTEM_3)
                        else
                            mArg:injectActionPacket(currentTarget:getID(), 3, primeWS.animationId, dmg, msg, 0, 0, mArg:getID())
                            player:printToPlayer(string.format("%s uses %s.\n%s takes %d point(s) of damage.", cleanName, primeWS.name, currentTarget:getName(), dmg), xi.msg.channel.SYSTEM_3)
                        end
                        
                        mArg:setTP(0)
                        local wsCd = mimicWSCooldowns[mArg:getMainJob()] or { min = 10, max = 20 }
                        mArg:setLocalVar('wsCooldown', currTime + math.random(wsCd.min, wsCd.max))
                        return
                    end
                end

                if mArg:getMainJob() == xi.job.BLU and not mArg:hasStatusEffect(xi.effect.SILENCE) and mArg:getCurrentAction() <= 1 and mArg:getLocalVar('spellToMimic') == 0 then
                    if mArg:getHPP() <= 75 and mArg:getLocalVar('bluThreshold75') == 0 then
                        mArg:castSpell(xi.magic.spell.MIGHTY_GUARD, mArg)
                        mArg:setLocalVar('bluThreshold75', 1)
                        return
                    elseif mArg:getHPP() <= 50 and mArg:getLocalVar('bluThreshold50') == 0 then
                        mArg:castSpell(xi.magic.spell.ERRATIC_FLUTTER, mArg)
                        mArg:setLocalVar('bluThreshold50', 1)
                        return
                    end
                end

                if mArg:getMainJob() == xi.job.BLU and currTime >= mArg:getLocalVar('bluCooldown') and not mArg:hasStatusEffect(xi.effect.SILENCE) and mArg:getCurrentAction() <= 1 and mArg:getLocalVar('spellToMimic') == 0 then
                    local spellToCast = bluBuffSpells[math.random(#bluBuffSpells)]
                    if spellToCast then
                        mArg:castSpell(spellToCast, mArg)
                        mArg:setLocalVar('bluCooldown', currTime + math.random(10, 15))
                        return
                    end
                end

                local spellToMimic = mArg:getLocalVar('spellToMimic')
                if spellToMimic > 0 then
                    if currTime >= mArg:getLocalVar('castTime') and mArg:getLocalVar('castWindow') > currTime and not mArg:hasStatusEffect(xi.effect.SILENCE) then
                        if mArg:getCurrentAction() <= 1 then
                            local targetId = mArg:getLocalVar('spellToMimicTarget')
                            if targetId == mArg:getID() then
                                mArg:castSpell(spellToMimic, mArg)
                            else
                                local spellTarget = GetPlayerByID(targetId)
                                if spellTarget then
                                    mArg:castSpell(spellToMimic, spellTarget)
                                else
                                    mArg:castSpell(spellToMimic)
                                end
                            end
                            mArg:setLocalVar('spellToMimic', 0)
                            mArg:setLocalVar('spellToMimicTarget', 0)
                        end
                    elseif currTime > mArg:getLocalVar('castWindow') then
                        mArg:setLocalVar('spellToMimic', 0)
                        mArg:setLocalVar('spellToMimicTarget', 0)
                    end
                end
            end)
        end,

        onMobFight = function(mob, targetObj)
            if targetObj and targetObj:isPC() then
                local currentMainItem = targetObj:getEquippedItem(xi.slot.MAIN)
                local currentMainId = currentMainItem and currentMainItem:getID() or 0
                local currentSubItem = targetObj:getEquippedItem(xi.slot.SUB)
                local currentSubId = currentSubItem and currentSubItem:getID() or 0
                local currentRangedItem = targetObj:getEquippedItem(xi.slot.RANGED)
                local currentRangedId = currentRangedItem and currentRangedItem:getID() or 0

                local ignoreRanged = targetObj:getMainJob() == xi.job.BRD or targetObj:getMainJob() == xi.job.GEO

                if currentMainId ~= mob:getLocalVar("SpawnMainWep") or
                   currentSubId ~= mob:getLocalVar("SpawnSubWep") or
                   (currentRangedId ~= mob:getLocalVar("SpawnRangedWep") and not ignoreRanged) then
                    
                    mob:setLocalVar("MimicFailing", 1)
                    targetObj:printToPlayer("You changed your weapons after the battle started. Battle aborted.", xi.msg.channel.SYSTEM_3)
                    targetObj:delStatusEffect(xi.effect.CONFRONTATION)
                    targetObj:delStatusEffect(xi.effect.SJ_RESTRICTION)
                    targetObj:delStatusEffect(xi.effect.MEDICINE)
                    targetObj:delStatusEffect(xi.effect.MAX_HP_BOOST)
                    targetObj:setCharVar("MimicBattleActive", 0)
                    targetObj:countdown()
                    mob:getZone():setLocalVar("MimicArena" .. arenaIdx, 0)
                    DespawnMob(mob:getID())
                    return
                end
                
                local spawnStatSum = mob:getLocalVar("SpawnPlayerStatSum")
                local currentStatSum = calculatePlayerStatSum(targetObj)

                if spawnStatSum > 0 and currentStatSum > spawnStatSum then
                    local diff = currentStatSum - spawnStatSum
                    local diffPercent = (diff / spawnStatSum) * 100

                    if diffPercent > MAX_STAT_INCREASE_PERCENT then
                        mob:setLocalVar("MimicFailing", 1)
                        targetObj:printToPlayer(string.format("Your stats increased by %.1f%%. Battle aborted to prevent exploit.", diffPercent), xi.msg.channel.SYSTEM_3)
                        targetObj:delStatusEffect(xi.effect.CONFRONTATION)
                        targetObj:delStatusEffect(xi.effect.SJ_RESTRICTION)
                        targetObj:delStatusEffect(xi.effect.MEDICINE)
                        targetObj:delStatusEffect(xi.effect.MAX_HP_BOOST)
                        targetObj:setCharVar("MimicBattleActive", 0)
                        targetObj:countdown()
                        mob:getZone():setLocalVar("MimicArena" .. arenaIdx, 0)
                        DespawnMob(mob:getID())
                        return
                    end
                end
            end

            if mob:getLocalVar("MimicListenersAdded") == 0 then
                mob:setLocalVar("MimicListenersAdded", 1)

                local listenerPrefix = "MIMIC_COPY_" .. mob:getID()

                player:addListener('MAGIC_TAKE', listenerPrefix .. "_SELF_SPELL", function(targ, caster, spell)
                    if caster:getID() == player:getID() and spell:tookEffect() and mob:isAlive() then
                        if math.random(1, 100) <= MIMIC_SPELL_COPY_CHANCE then
                            local spellId = spell:getID()
                            if not mob:hasStatusEffect(xi.effect.SILENCE) and mob:getCurrentAction() <= 1 then
                                mob:castSpell(spellId, mob)
                            end
                        end
                    end
                end)

                player:addListener('ABILITY_USE', listenerPrefix .. "_JA", function(caster, abilityTarget, ability, action)
                    if caster:getID() == player:getID() and mob:isAlive() then
                        local abilityId = ability:getID()
                        if abilityCategories.twoHour[abilityId] then
                            if mob:getMainJob() == xi.job.BLU and not mob:hasStatusEffect(xi.effect.SILENCE) and mob:getCurrentAction() <= 1 then
                                local reaction = bluReactions.twoHour[math.random(#bluReactions.twoHour)]
                                mob:castSpell(reaction.id, reaction.targetSelf and mob or caster)
                            end
                        elseif abilityCategories.offensive[abilityId] then
                            if mob:getMainJob() == xi.job.BLU and not mob:hasStatusEffect(xi.effect.SILENCE) and mob:getCurrentAction() <= 1 then
                                local reaction = bluReactions.offensive[math.random(#bluReactions.offensive)]
                                mob:castSpell(reaction.id, reaction.targetSelf and mob or caster)
                            end
                        elseif abilityCategories.defensive[abilityId] then
                            if mob:getMainJob() == xi.job.BLU and not mob:hasStatusEffect(xi.effect.SILENCE) and mob:getCurrentAction() <= 1 then
                                local reaction = bluReactions.defensive[math.random(#bluReactions.defensive)]
                                mob:castSpell(reaction.id, reaction.targetSelf and mob or caster)
                            end
                        elseif abilityCategories.buff[abilityId] then
                            if mob:getMainJob() == xi.job.BLU and not mob:hasStatusEffect(xi.effect.SILENCE) and mob:getCurrentAction() <= 1 then
                                local reaction = bluReactions.buff[math.random(#bluReactions.buff)]
                                mob:castSpell(reaction.id, reaction.targetSelf and mob or caster)
                            end
                        elseif abilityCategories.debuff[abilityId] then
                            if mob:getMainJob() == xi.job.BLU and not mob:hasStatusEffect(xi.effect.SILENCE) and mob:getCurrentAction() <= 1 then
                                local reaction = bluReactions.debuff[math.random(#bluReactions.debuff)]
                                mob:castSpell(reaction.id, reaction.targetSelf and mob or caster)
                            end
                        end
                    end
                end)
            end
        end,

        onMobDisengage = function(mob)
            local listenerPrefix = "MIMIC_COPY_" .. mob:getID()
            player:removeListener(listenerPrefix .. "_SELF_SPELL")
            player:removeListener(listenerPrefix .. "_JA")
            mob:setLocalVar("MimicListenersAdded", 0)
            mob:setLocalVar("spellToMimic", 0)
            mob:setLocalVar("spellToMimicTarget", 0)
            mob:setLocalVar("MimicTwoHourUsed", 0)
            mob:setLocalVar("bluThreshold75", 0)
            mob:setLocalVar("bluThreshold50", 0)
            mob:setLocalVar("prebuffPhase", 1)
            mob:setLocalVar("chainspellCooldown", 0)
            local wsCd = mimicWSCooldowns[mob:getMainJob()] or { min = 10, max = 20 }
            mob:setLocalVar("wsCooldown", os.time() + wsCd.min)
            
            mob:timer(3000, function(mArg) startPrebuffSequence(mArg) end)

            mob:timer(10000, function(mArg)
                if not mArg:isEngaged() then
                    mArg:setLocalVar("MimicFailing", 1)
                    player:delStatusEffect(xi.effect.CONFRONTATION)
                    player:delStatusEffect(xi.effect.SJ_RESTRICTION)
                    player:delStatusEffect(xi.effect.MEDICINE)
                    player:delStatusEffect(xi.effect.MAX_HP_BOOST)
                    player:setCharVar("MimicBattleActive", 0)
                    player:countdown()
                    raisePlayer(player)
                    mArg:getZone():setLocalVar("MimicArena" .. arenaIdx, 0)
                    DespawnMob(mArg:getID())
                end
            end)
        end,

        onMobDeath = function(mob, killer, isKiller)
            if mob:getLocalVar("MimicFailing") == 1 then
                return
            end
            local listenerPrefix = "MIMIC_COPY_" .. mob:getID()
            player:removeListener(listenerPrefix .. "_SELF_SPELL")
            player:removeListener(listenerPrefix .. "_JA")
            
            player:delStatusEffect(xi.effect.CONFRONTATION)
            player:delStatusEffect(xi.effect.SJ_RESTRICTION)
            player:delStatusEffect(xi.effect.MEDICINE)
            player:delStatusEffect(xi.effect.MAX_HP_BOOST)
            player:setCharVar("MimicBattleActive", 0)
            player:countdown()
            mob:getZone():setLocalVar("MimicArena" .. arenaIdx, 0)
            
            if player:isDead() then
                player:printToPlayer("Both you and your Mimic have fallen. The battle is a draw.", xi.msg.channel.SYSTEM_3)
                raisePlayer(player)
                return
            end

            local startTime = mob:getLocalVar("battleStartTime")
            if startTime > 0 and player:getGMLevel() == 0 then
                local duration = os.time() - startTime
                local job = mob:getMainJob()
                local wepType = mob:getLocalVar("SpawnWeaponType")
                local currentRecord = GetServerVariable("MimicRecord_Time_" .. job)
                
                if currentRecord == 0 or duration < currentRecord then
                    SetServerVariable("MimicRecord_Time_" .. job, duration)
                    SetServerVariableString("MimicRecord_Name_" .. job, player:getName())
                    
                    local mins = math.floor(duration / 60)
                    local secs = duration % 60
                    player:printToArea(string.format("%s has set a new Mimic battle record for %s with a time of %02d:%02d!", player:getName(), jobNames[job] or "Unknown", mins, secs), xi.msg.channel.SYSTEM_3)
                    
                    if player:getName() == "Genesis" then
                        player:printToArea("We get it Genesis, you're really good at the the game", xi.msg.channel.SYSTEM_3)
                    end
                else
                    player:printToPlayer("You have defeated your Mimic!", xi.msg.channel.SYSTEM_3)
                end
                
                local currentWepRecord = GetServerVariable("MimicWepRecord_Time_" .. wepType)
                if currentWepRecord == 0 or duration < currentWepRecord then
                    SetServerVariable("MimicWepRecord_Time_" .. wepType, duration)
                    SetServerVariableString("MimicWepRecord_Name_" .. wepType, player:getName())
                    
                    local mins = math.floor(duration / 60)
                    local secs = duration % 60
                    player:printToArea(string.format("%s has set a new Mimic weapon record for %s with a time of %02d:%02d!", player:getName(), weaponNames[wepType] or "Unknown Weapon", mins, secs), xi.msg.channel.SYSTEM_3)
                    
                    if player:getName() == "Genesis" then
                        player:printToArea("We get it Genesis, you're really good at the the game", xi.msg.channel.SYSTEM_3)
                    end
                end
            else
                player:printToPlayer("You have defeated your Mimic!", xi.msg.channel.SYSTEM_3)
            end
            
            player:setHP(player:getMaxHP())
            player:setMP(player:getMaxMP())
        end,
    })
    
    if mob then
        zone:setLocalVar("MimicArena" .. arenaIdx .. "_MobID", mob:getID())
        mob:setSpawn(farX, farY, farZ, spawnRot)
        mob:spawn()
        
        local addedCore = {
            [xi.mod.STR] = 0, [xi.mod.DEX] = 0, [xi.mod.VIT] = 0,
            [xi.mod.AGI] = 0, [xi.mod.INT] = 0, [xi.mod.MND] = 0, [xi.mod.CHR] = 0
        }
        
        for _, id in ipairs(coreMods) do
            local diff = tStats[id] - mob:getStat(id)
            if diff > 0 then
                mob:addMod(id, diff)
                addedCore[id] = diff
            end
        end

        for _, id in ipairs(derivedMods) do
            local targetVal = tStats[id]
            if id == xi.mod.ATT then targetVal = targetVal - math.floor(addedCore[xi.mod.STR] * 0.5)
            elseif id == xi.mod.DEF then targetVal = targetVal - math.floor(addedCore[xi.mod.VIT] * 0.5)
            elseif id == xi.mod.EVA then targetVal = targetVal - math.floor(addedCore[xi.mod.AGI] * 0.5)
            elseif id == xi.mod.ACC then targetVal = targetVal - math.floor(addedCore[xi.mod.DEX] * 0.75) + 150
            end
            
            local diff = targetVal - mob:getStat(id)
            if diff > 0 then
                mob:addMod(id, diff)
            end
        end

        for _, id in ipairs(normalMods) do
            local diff = tStats[id] - mob:getMod(id)
            if diff ~= 0 then
                mob:addMod(id, diff)
            end
        end
        
        mob:setHP(mob:getMaxHP())
        mob:setMP(tMaxMP)
        mob:setUntargetable(true)
        
        player:timer(500, function(p)
            if mob and mob:isSpawned() then
                mob:setSpawn(spawnX, spawnY, spawnZ, spawnRot)
                mob:setPos(spawnX, spawnY, spawnZ, spawnRot)
                mob:setUntargetable(false)
            end
        end)
    else
        player:printToPlayer("Failed to spawn mimic.", xi.msg.channel.SYSTEM_3)
        zone:setLocalVar("MimicArena" .. arenaIdx, 0)
    end
end

local function showLeaderboard(player, page, isWeapon)
    local title = isWeapon and "Weapon Records" or "Job Records"
    local menu = { title = string.format("%s (Page %d)", title, page), options = {} }
    local startIdx = (page - 1) * 3 + 1
    local endIdx = 0
    
    if isWeapon then
        endIdx = math.min(startIdx + 2, #weaponKeys)
        for i = startIdx, endIdx do
            local wepType = weaponKeys[i]
            local time = GetServerVariable("MimicWepRecord_Time_" .. wepType)
            local name = GetServerVariableString("MimicWepRecord_Name_" .. wepType)
            local wepName = weaponNames[wepType] or "Unknown"
            if time == 0 then
                table.insert(menu.options, { string.format("%s: No Record", wepName), function() end })
            else
                local mins = math.floor(time / 60)
                local secs = time % 60
                table.insert(menu.options, { string.format("%s: %s (%02d:%02d)", wepName, name, mins, secs), function() end })
            end
        end
        if endIdx < #weaponKeys then table.insert(menu.options, { "Next Page", function(p) showLeaderboard(p, page + 1, isWeapon) end }) end
    else
        endIdx = math.min(startIdx + 2, 22)
        for i = startIdx, endIdx do
            local time = GetServerVariable("MimicRecord_Time_" .. i)
            local name = GetServerVariableString("MimicRecord_Name_" .. i)
            local jobName = jobNames[i] or "Unknown"
            if time == 0 then
                table.insert(menu.options, { string.format("%s: No Record", jobName), function() end })
            else
                local mins = math.floor(time / 60)
                local secs = time % 60
                table.insert(menu.options, { string.format("%s: %s (%02d:%02d)", jobName, name, mins, secs), function() end })
            end
        end
        if endIdx < 22 then table.insert(menu.options, { "Next Page", function(p) showLeaderboard(p, page + 1, isWeapon) end }) end
    end
    
    if page > 1 then table.insert(menu.options, { "Previous Page", function(p) showLeaderboard(p, page - 1, isWeapon) end }) end
    table.insert(menu.options, { "Close", function() end })
    
    delaySendMenu(player, menu)
end

local npcEntity = {}

npcEntity.onTrigger = function(player, npc)
    local zone = player:getZone()

    -- Failsafe to clean up stale arena locks (e.g., from server crashes or despawns)
    for i = 1, 1 do
        if zone:getLocalVar("MimicArena" .. i) == 1 then
            local mobId = zone:getLocalVar("MimicArena" .. i .. "_MobID")
            local mob = mobId > 0 and GetMobByID(mobId) or nil
            
            -- If the mob no longer exists, despawned, or the dynamic ID was reused by something else
            if not mob or not mob:isSpawned() or not string.find(mob:getName(), "Optimus Prime") then
                zone:setLocalVar("MimicArena" .. i, 0)
                zone:setLocalVar("MimicArena" .. i .. "_MobID", 0)
            end
        end
    end

    if player:getCharVar("MimicBattleActive") == 1 then
        local arenaIdx = player:getLocalVar("MimicArena")
        local isMimicAlive = false

        if arenaIdx > 0 then
            local mobId = zone:getLocalVar("MimicArena" .. arenaIdx .. "_MobID")
            local mob = mobId > 0 and GetMobByID(mobId) or nil
            if mob and mob:isSpawned() and mob:isAlive() and string.find(mob:getName(), "Optimus Prime") then
                isMimicAlive = true
            end
        end

        if isMimicAlive then
            player:customMenu({
                title = 'Do you wish to forfeit the battle?',
                options = {
                    { 'Yes', function(p)
                        local z = p:getZone()
                        
                        if arenaIdx > 0 then
                            local mobId = z:getLocalVar("MimicArena" .. arenaIdx .. "_MobID")
                            if mobId > 0 then
                                local mimMob = GetMobByID(mobId)
                                if mimMob then mimMob:setLocalVar("MimicFailing", 1) end
                            end
                        end

                        p:delStatusEffect(xi.effect.CONFRONTATION)
                        p:delStatusEffect(xi.effect.SJ_RESTRICTION)
                        p:delStatusEffect(xi.effect.MEDICINE)
                        p:delStatusEffect(xi.effect.MAX_HP_BOOST)
                        p:setCharVar("MimicBattleActive", 0)
                        p:countdown()
                        
                        if arenaIdx > 0 then
                            local mobId = z:getLocalVar("MimicArena" .. arenaIdx .. "_MobID")
                            if mobId > 0 then
                                local listenerPrefix = "MIMIC_COPY_" .. mobId
                                p:removeListener(listenerPrefix .. "_SELF_SPELL")
                                p:removeListener(listenerPrefix .. "_JA")
                                DespawnMob(mobId)
                            end
                            z:setLocalVar("MimicArena" .. arenaIdx, 0)
                            z:setLocalVar("MimicArena" .. arenaIdx .. "_MobID", 0)
                            p:setLocalVar("MimicArena", 0)
                        end
                        p:printToPlayer("You have forfeited the battle.", xi.msg.channel.SYSTEM_3)
                    end },
                    { 'No', function(p) end }
                }
            })
            return
        else
            player:setCharVar("MimicBattleActive", 0)
            player:setLocalVar("MimicArena", 0)
        end
    end

    if player:getAverageItemLevel() < 119 then
        player:printToPlayer("You must be item level 119 to battle your Mimic.", xi.msg.channel.SYSTEM_3)
        return
    end

    local party = player:getParty()
    if (party and #party > 1) or player:checkSoloPartyAlliance() ~= 0 then
        player:printToPlayer("You must be completely solo to battle your Mimic. Please leave your party and dismiss any trusts.", xi.msg.channel.SYSTEM_3)
        return
    end

    local menuOptions = {
        { string.format('Battle Mimic (%d JP)', MIMIC_JP_COST), function(p)
                if p:getAverageItemLevel() < 119 then
                    p:printToPlayer("You must be item level 119 to battle your Mimic.", xi.msg.channel.SYSTEM_3)
                    return
                end

                local pParty = p:getParty()
                if (pParty and #pParty > 1) or p:checkSoloPartyAlliance() ~= 0 then
                    p:printToPlayer("You must be completely solo to battle your Mimic. Please leave your party and dismiss any trusts.", xi.msg.channel.SYSTEM_3)
                    return
                end

                local job = p:getMainJob()
                local currentJP = p.getJobPoint and p:getJobPoint(job) or p.getJobPoints and p:getJobPoints(job) or 0
                if MIMIC_JP_COST > 0 and currentJP < MIMIC_JP_COST then
                    p:printToPlayer(string.format("You do not have enough Job Points to battle your Mimic. (Requires %d JP)", MIMIC_JP_COST), xi.msg.channel.SYSTEM_3)
                    return
                end

                local zone = p:getZone()
                local arenaIdx = nil
                
                if zone:getLocalVar("MimicArena1") == 0 then
                    arenaIdx = 1
                end

                if not arenaIdx then
                    p:printToPlayer("The arena is currently occupied.", xi.msg.channel.SYSTEM_3)
                    return
                end
                
            local rangedItem = p:getEquippedItem(xi.slot.RANGED)
            local rangedSkill = p:getWeaponSkillType(xi.slot.RANGED)
            local isRangedJob = (job == xi.job.RNG or job == xi.job.COR)
            
            local hasRangedWS = false
            if isRangedJob and rangedItem then
                local isWeapon = false
                if type(rangedItem.isType) == 'function' then
                    isWeapon = rangedItem:isType(xi.itemType.WEAPON)
                elseif type(rangedItem.getItemType) == 'function' then
                    isWeapon = rangedItem:getItemType() == xi.itemType.WEAPON
                end
                
                if isWeapon and (rangedSkill == xi.skill.ARCHERY or rangedSkill == xi.skill.MARKSMANSHIP) then
                    hasRangedWS = true
                end
            end
            
            local function doBattle(overrideWepType)
                if MIMIC_JP_COST > 0 then
                    if p.setJobPoint then p:setJobPoint(job, currentJP - MIMIC_JP_COST)
                    elseif p.setJobPoints then p:setJobPoints(job, currentJP - MIMIC_JP_COST) end
                    p:printToPlayer(string.format("You spent %d Job Points to battle your Mimic.", MIMIC_JP_COST), xi.msg.channel.SYSTEM_3)
                end

                local confrontationID = 5000 + arenaIdx
                zone:setLocalVar("MimicArena" .. arenaIdx, 1)
                spawnMimic(p, arenaIdx, confrontationID, overrideWepType)
            end
            
            if hasRangedWS then
                local wsName = (rangedSkill == xi.skill.ARCHERY) and "Sarv (Archery)" or "Terminus (Marksmanship)"
                local subMenu = {
                    title = 'Select Weapon to Unlock',
                    options = {
                        { 'Main Hand Weapon', function(p_sub) doBattle(nil) end },
                        { wsName, function(p_sub) doBattle(rangedSkill) end },
                        { 'Cancel', function(p_sub) end }
                    }
                }
                delaySendMenu(p, subMenu)
            else
                doBattle(nil)
            end
        end },
        { 'View Job Leaderboard', function(p)
            showLeaderboard(p, 1, false)
        end },
        { 'View Weapon Leaderboard', function(p)
            showLeaderboard(p, 1, true)
        end }
    }
    
    if player:getGMLevel() > 0 then
        table.insert(menuOptions, { 'Reset Leaderboards (GM)', function(p)
            for i = 1, 22 do
                SetServerVariable("MimicRecord_Time_" .. i, 0)
                SetServerVariableString("MimicRecord_Name_" .. i, "")
            end
            for _, wepType in ipairs(weaponKeys) do
                SetServerVariable("MimicWepRecord_Time_" .. wepType, 0)
                SetServerVariableString("MimicWepRecord_Name_" .. wepType, "")
            end
            p:printToPlayer("Mimic leaderboards have been reset.", xi.msg.channel.SYSTEM_3)
        end })
    end
    
    table.insert(menuOptions, { 'Cancel', function(p) end })

    player:printToPlayer("I'm watching closely, don't try to cheese this or I'll kick you to the curb and you won't get your stuff back", 0, npc:getName())
    delaySendMenu(player, { title = 'Mimic Battle Arena', options = menuOptions })
end

return npcEntity