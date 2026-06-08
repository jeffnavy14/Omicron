-----------------------------------
-- func: fafnir
-- desc: Summon a fightable Fafnir (no loot)
-- note:
-----------------------------------
mixins = { require('scripts/mixins/rage') }
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = ''
}

local DEBUG_CONTRIB_TRACKER = true

local TRACKED_MAGIC_GROUPS = {
    [xi.magic.spellGroup.BLACK]     = true,
    [xi.magic.spellGroup.BLUE]      = true,
    [xi.magic.spellGroup.NINJUTSU]  = true,
    [xi.magic.spellGroup.SUMMONING] = true,
    [xi.magic.spellGroup.WHITE]     = true,
    [xi.magic.spellGroup.GEOMANCY]  = true,
    [xi.magic.spellGroup.SONG]      = true,
}

local TRACKED_DAMAGE_TYPES = {
    [xi.damageType.NONE]        = true,
    [xi.damageType.PIERCING]    = true,
    [xi.damageType.SLASHING]    = true,
    [xi.damageType.BLUNT]       = true,
    [xi.damageType.HTH]         = true,
    [xi.damageType.ELEMENTAL]   = true, -- Generic Element
    [xi.damageType.FIRE]        = true,
    [xi.damageType.ICE]         = true,
    [xi.damageType.WIND]        = true,
    [xi.damageType.EARTH]       = true,
    [xi.damageType.THUNDER]     = true,
    [xi.damageType.WATER]       = true,
    [xi.damageType.LIGHT]       = true,
    [xi.damageType.DARK]        = true,
}

local JOB_ABILITIES_TO_TRACK = {
    [1] 	= true, -- MIGHTY_STRIKES
    [2] 	= true, -- HUNDRED_FISTS
    [3] 	= true, -- BENEDICTION
    [4] 	= true, -- MANAFONT

}

-- Global identifier prefix for listeners on the mob (used for addListener/removeListener)
local LISTENER_ID_PREFIX = 'CAMPAIGN_POINT_TRACKER_'

local function trackPlayerContribution(player, varName, multiplier)
    -- This check is crucial to ensure we only track real players
    if player and player:isPC() then
        local currentScore = player:getCharVar(varName)
        local newScore = currentScore + multiplier
        player:setCharVar(varName, newScore)
        log_debug(string.format("[Score] Player %s gained %d points for %s. Total: %d", 
                  player:getName(), multiplier, varName, newScore))
    end
end

-- Unique CharVar identifiers for each event type (used to track player contributions)
local CONTRIBUTION_VARS = {
    ABILITY_USE = 'PB_AbilityUseCount',
    DAMAGE_DONE_HIT = 'PB_DmgDoneCount',
    CRITICAL_TAKE = 'PB_CriticalTakeCount',
    WEAPONSKILL_USE = 'PB_WSUseCount',
    MAGIC_USE = 'PB_MagicUseCount',
    RANGE_STATE_EXIT = 'PB_RangeExitCount',
}

-- Multipliers for points awarded per event. Adjust these values to fine-tune score weighting.
local POINT_MULTIPLIERS = {
    ABILITY_USE = 3,    -- Points for using a Job Ability (JA) or Job Trait (JT) -- Check JOB_ABILITIES_TO_TRACK for list
    DAMAGE_DONE_HIT = 1, -- Points for a successful damage done
    CRITICAL_TAKE = 1,  -- Points awarded when the mob takes a critical hit
    WEAPONSKILL_USE = 3, -- Points for using a Weapon Skill
    MAGIC_USE = 5,      -- Points for using a Spell (Ninjutsu, White/Black Magic, etc.)
    RANGE_STATE_EXIT = 3, -- Points for finishing a Ranged Attack action
}


commandObj.onTrigger = function(player)
    local zoneOrInstanceObj = player:getZone()

    local instance = player:getInstance()
    if instance then
        zoneOrInstanceObj = instance
    end

    -- Decorations for the mob name
    local openingDecoration = '\129\155' -- 
    local mid1Decoration = '\129\153'    -- 
    local mid2Decoration = '\129\154'    -- 
    local closingDecoration = '\129\154' -- 
    local end1Decoration = '\129\154'    -- 
    local end2Decoration = '\129\155'    -- 

    local mobName = "Conflux"
    local namez = string.format('%s%s%s %s %s%s%s', openingDecoration, mid1Decoration, mid2Decoration, mobName, closingDecoration, end1Decoration, end2Decoration)

    local mob = zoneOrInstanceObj:insertDynamicEntity({

        objtype = xi.objType.MOB,
        name = "Test",
        look = '01000803A4109621A430A440A4505063A8700000',       
        x = player:getXPos(),
        y = player:getYPos(),
        z = player:getZPos(),
        rotation = player:getRotPos(),
        entityFlags = 925,
        groupId = 41,
        groupZoneId = 81,
        minLevel = 150,
        maxLevel = 150,
        ---------------------------------------------------------------------------
        -----------onMobSpawn
        ---------------------------------------------------------------------------
        onMobSpawn = function(mob)
        mob:setMobLevel(135)

        mob:addMod(xi.mod.HPP, 9000)
        mob:updateHealth()
        mob:addHP(mob:getMaxHP())    
        mob:setMobMod(xi.mobMod.NO_MOVE, 1)
        mob:setMobMod(xi.mobMod.NO_DROPS, 1) 
        mob:setMobMod(xi.mobMod.CLAIM_TYPE, xi.claimType.UNCLAIMABLE)
        



--========
--Testing Listeners
--========


           local procjobs =
    {
        [xi.job.WAR] = 'ws',
        [xi.job.MNK] = 'ja',
        [xi.job.WHM] = 'ma',
        [xi.job.BLM] = 'ma',
        [xi.job.RDM] = 'ma',
        [xi.job.THF] = 'ja',
        [xi.job.PLD] = 'ws',
        [xi.job.DRK] = 'ws',
        [xi.job.BST] = 'ja',
        [xi.job.BRD] = 'ma',
        [xi.job.RNG] = 'ja',
        [xi.job.SAM] = 'ws',
        [xi.job.NIN] = 'ja',
        [xi.job.DRG] = 'ws',
        [xi.job.SMN] = 'ma',
        [xi.job.DNC] = 'ja',
        [xi.job.SCH] = 'ma',
        [xi.job.RUN] = 'ws',
        [xi.job.GEO] = 'ma',
        [xi.job.COR] = 'ja',
        [xi.job.BLU] = 'ma',
        [xi.job.PUP] = 'ws',
    }


       mob:addListener('WEAPONSKILL_TAKE', 'BEHEMOTH_WEAPONSKILL_TAKE', function(target, user, wsid) -- removes ability to use Benidiction at 10%
       end)
       mob:addListener('ABILITY_TAKE', 'BEHEMOTH_ABILITY_TAKE', function(mob, user, ability, action) -- removed status effects
       end)

        -- procing system
        -- target:weaknessTrigger(3) -- White proc
        -- target:weaknessTrigger(2) -- Red proc
        -- target:weaknessTrigger(1) -- Yellow proc
        -- target:weaknessTrigger(0) -- Blue proc

        local elements =
        {
            { xi.mod.HTH_SDT,    xi.day.FIRESDAY      },
            { xi.mod.SLASH_SDT,  xi.day.EARTHSDAY     },
            { xi.mod.PIERCE_SDT, xi.day.WATERSDAY     },
            { xi.mod.IMPACT_SDT, xi.day.WINDSDAY      },
            { xi.mod.HTH_SDT,    xi.day.ICEDAY        },
            { xi.mod.SLASH_SDT,  xi.day.LIGHTNINGSDAY },
            { xi.mod.PIERCE_SDT, xi.day.LIGHTSDAY     },
            { xi.mod.IMPACT_SDT, xi.day.DARKSDAY      },
        }
        local blah = 0
        local blaha = 0
            local dayOfWeek = VanadielDayOfTheWeek()
                for k, v in pairs(elements) do
                    if dayOfWeek == v[2] then
                       mob:setMod(v[1], 0)
                    end
                end
        end,
        ---------------------------------------------------------------------------
        -----------onMobFight
        ---------------------------------------------------------------------------

                onMobFight = function(mob, target)
                    -- Add contribution listeners only if the target is a player
                    if target and target:isPC() then

-- ====================================================================
-- 3. ABILITY_USE Listener (Job Ability Attempt)
-- ====================================================================

local ABILITY_LISTENER_NAME = LISTENER_ID_PREFIX .. 'ABILITY_TAKE_CONTRIB'

-- Uses ABILITY_TAKE event for reliable successful ability tracking.
-- Signature: (mobTarget, caster, ability, action)
mob:addListener('ABILITY_TAKE', ABILITY_LISTENER_NAME, function(mobTarget, caster, ability, action)
    if DEBUG_CONTRIB_TRACKER then print("--- ABILITY_TAKE DEBUG START ---") end

    -- Check 1: Ensure the caster ('player') is a Player Character (PC) and exists.
    if not caster or not caster:isPC() then 
        if DEBUG_CONTRIB_TRACKER then print("DEBUG: ABILITY_TAKE: Caster is NOT a PC. Returning.") end
        return
    end
    
    -- Check 2: Ensure the 'ability' object is valid
    if not ability then
        if DEBUG_CONTRIB_TRACKER then print("DEBUG: ABILITY_TAKE: Ability object is NIL. Returning.") end
        return
    end

    -- Extract ability ID safely
    local abilityID = ability:getID()
    
    if DEBUG_CONTRIB_TRACKER then 
        print(string.format("DEBUG: ABILITY_TAKE: Caster: %s", caster:getName()))
        print(string.format("DEBUG: ABILITY_TAKE: Target (Mob): %s", mobTarget:getName()))
        print(string.format("DEBUG: ABILITY_TAKE: Ability ID received: %s", abilityID))
    end

    -- Check 3: Verify the numerical abilityID is in our specific lookup table (Job Abilities only).
    if abilityID > 0 and JOB_ABILITIES_TO_TRACK[abilityID] then
        -- If the ability is tracked, award the player contribution points.
        trackPlayerContribution(caster, CONTRIBUTION_VARS.ABILITY_USE, POINT_MULTIPLIERS.ABILITY_USE)
        if DEBUG_CONTRIB_TRACKER then print("DEBUG: ABILITY_TAKE: Ability ID MATCHED. Contribution logged.") end
    else
        if DEBUG_CONTRIB_TRACKER then print("DEBUG: ABILITY_TAKE: ID NOT TRACKED.") end
    end
    if DEBUG_CONTRIB_TRACKER then print("--- ABILITY_TAKE DEBUG END ---") end
end)

-- ====================================================================
-- 1. MAGIC_TAKE Listener (Spell Successfully Lands on Mob)
-- ====================================================================

-- Switched to MAGIC_TAKE event. Signature: (mobTarget, caster, spell).
local MAGIC_LISTENER_NAME = LISTENER_ID_PREFIX .. 'MAGIC_TAKE' 

mob:addListener('MAGIC_TAKE', MAGIC_LISTENER_NAME, function(mobTarget, caster, spell)
    if DEBUG_CONTRIB_TRACKER then
        print("--- MAGIC_TAKE DEBUG START ---")
        print(string.format("Caster: %s (Type: %s)", caster and caster:getName() or "UNKNOWN", caster and (caster:isPC() and "PC" or "MOB") or "MISSING"))
    end
    
    -- Safety check: Only track contribution if the caster is a Player Character (PC).
    if not caster or not caster:isPC() then
        if DEBUG_CONTRIB_TRACKER then print("DEBUG: Caster is NOT a PC. Returning.") end
        return
    end

    -- Safety check: Check if the 'spell' object is valid
    if not spell then
        if DEBUG_CONTRIB_TRACKER then print("DEBUG: Spell object is NIL. Returning.") end
        return
    end

    -- CRITICAL: Only award points if the spell successfully took effect (not resisted/missed).
    if not spell:tookEffect() then
        if DEBUG_CONTRIB_TRACKER then print("DEBUG: Spell did NOT take effect. Returning.") end
        return
    end

    -- Use getSpellGroup() as confirmed by working examples.
    local spellGroup = spell:getSpellGroup() 

    if DEBUG_CONTRIB_TRACKER then
        print(string.format("DEBUG: Valid PC Caster: %s", caster:getName()))
        print(string.format("DEBUG: Spell Group ID received: %s (via getSpellGroup())", spellGroup))
    end
    
    -- Check for tracking eligibility using the hash lookup table.
    local isTrackedMagic = TRACKED_MAGIC_GROUPS[spellGroup]

    if isTrackedMagic then
        -- Track contribution for the successful spell that took effect.
        trackPlayerContribution(caster, CONTRIBUTION_VARS.MAGIC_USE, POINT_MULTIPLIERS.MAGIC_USE)
        if DEBUG_CONTRIB_TRACKER then print("DEBUG: Spell Group MATCHED. Contribution logged.") end
    else
        if DEBUG_CONTRIB_TRACKER then print("DEBUG: Spell Group NOT TRACKED.") end
    end
    
    if DEBUG_CONTRIB_TRACKER then print("--- MAGIC_TAKE DEBUG END ---") end
end)

                        
--                        -- RANGE_STATE_EXIT: Entity (player), Target (mob), action
--                        mob:addListener('RANGE_STATE_EXIT', LISTENER_ID_PREFIX .. 'RANGE_STATE_EXIT', function(player, mobTarget, ...)
--                           trackPlayerContribution(player, CONTRIBUTION_VARS.RANGE_STATE_EXIT, POINT_MULTIPLIERS.RANGE_STATE_EXIT)
--                        end)
                        
                        --log_debug("Added campaign contribution listeners to mob ID: " .. mob:getID())
                    end
                end,
        ---------------------------------------------------------------------------
        -----------onSpellPrecast
        ---------------------------------------------------------------------------
        onSpellPrecast = function(mob, spell)
        end,
        ---------------------------------------------------------------------------
        -----------onMagicHit
        ---------------------------------------------------------------------------
        onMagicHit = function(caster, target, spell)
        end,
        ---------------------------------------------------------------------------
        -----------onMobDeath
        ---------------------------------------------------------------------------
        onMobDeath = function(mob, playerArg, optParams)
        -- spawn chest
        -- look 2425 purple chest
        -- 2426 rainbow chest
        -- 969 gold chest
        -- 968 red chest
        -- 965 blue chest
        -- 967 brown chest
        end,


        releaseIdOnDisappear = true,

        -- You can apply mixins like you would with regular mobs. mixinOptions aren't supported yet.
        mixins =
        {
            require('scripts/mixins/rage'),
            require('scripts/mixins/job_special'),
        },
        specialSpawnAnimation = true,
    })

    -- Use the mob object as you normally would
    mob:setSpawn(player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos())

    mob:spawn()

    player:printToPlayer(string.format('Spawning Fafnir (Lv: %i, HP: %i)\n%s', mob:getMainLvl(), mob:getMaxHP(), mob))
end

return commandObj
