-----------------------------------
-- Alexander HTBF Logic
-----------------------------------

local spawnedMobs = {}
local engagedMobs = {}

local function setup(m, config, helpers)
    local debugPrint = helpers.debugPrint
    local ensureTable = helpers.ensureTable
    local applyMobMods = helpers.applyMobMods
    local checkConfrontation = helpers.checkConfrontation

    -- Define debuffEffects as it was missing in the original scope
local debuffEffects = {
    xi.effect.ACCURACY_DOWN, xi.effect.ADDLE, xi.effect.AGI_DOWN, xi.effect.AMNESIA,
    xi.effect.ASPIR_DAZE, xi.effect.ATTACK_DOWN, xi.effect.BANE, xi.effect.BIND,
    xi.effect.BIO or 135, xi.effect.BLINDNESS, xi.effect.BURN, xi.effect.BUST,
    xi.effect.CHARM_I, xi.effect.CHARM_II, xi.effect.CHOKE, xi.effect.CHR_DOWN,
    xi.effect.CURSE, xi.effect.CURSE_I, xi.effect.CURSE_II,
    xi.effect.DEFENSE_DOWN, xi.effect.DEX_DOWN, xi.effect.DIA or 134,
    xi.effect.DISEASE, xi.effect.DOOM, xi.effect.DRAIN_DAZE, xi.effect.DROWN,
    xi.effect.ELEGY, xi.effect.EVASION_DOWN, xi.effect.FLASH, xi.effect.FROST,
    xi.effect.GRADUAL_PETRIFICATION, xi.effect.GRAVITY, xi.effect.HELIX,
    xi.effect.IMPAIRMENT, xi.effect.INT_DOWN, xi.effect.LETHARGIC_DAZE_1,
    xi.effect.LETHARGIC_DAZE_2, xi.effect.LETHARGIC_DAZE_3, xi.effect.LETHARGIC_DAZE_4,
    xi.effect.LETHARGIC_DAZE_5, xi.effect.MAGIC_ACC_DOWN, xi.effect.MAGIC_ATK_DOWN,
    xi.effect.MAGIC_DEF_DOWN, xi.effect.MAGIC_EVASION_DOWN, xi.effect.MAX_HP_DOWN,
    xi.effect.MAX_MP_DOWN, xi.effect.MAX_TP_DOWN, xi.effect.MND_DOWN,
    xi.effect.OMERTA, xi.effect.PARALYSIS, xi.effect.PETRIFICATION, xi.effect.PLAGUE, xi.effect.POISON, xi.effect.RASP,
    xi.effect.REQUIEM, xi.effect.SHOCK, xi.effect.SILENCE, xi.effect.SLEEP_I,
    xi.effect.SLEEP_II, xi.effect.SLOW, xi.effect.SLUGGISH_DAZE_1, xi.effect.SLUGGISH_DAZE_2,
    xi.effect.SLUGGISH_DAZE_3, xi.effect.SLUGGISH_DAZE_4, xi.effect.SLUGGISH_DAZE_5,
    xi.effect.STR_DOWN, xi.effect.STUN, xi.effect.TERROR, xi.effect.THRENODY,
    xi.effect.VIT_DOWN, xi.effect.WEIGHT, xi.effect.NUKE_WALL
}


    if config then
        local mobTablePath = string.format("xi.zones.%s.mobs.%s", config.zoneName, config.mobName)
        ensureTable(mobTablePath)

        m:addOverride(mobTablePath .. ".onMobInitialize", function(mob)
             debugPrint("onMobInitialize called for " .. mob:getName())
            mob:addImmunity(xi.immunity.GRAVITY)
            mob:addImmunity(xi.immunity.BIND)
            mob:addImmunity(xi.immunity.SILENCE)
            mob:addImmunity(xi.immunity.DARK_SLEEP)
            mob:addImmunity(xi.immunity.LIGHT_SLEEP)
            mob:addImmunity(xi.immunity.PETRIFY)
            mob:addImmunity(xi.immunity.TERROR)
            mob:setMod(xi.mod.REGAIN, 150)
        end)

        m:addOverride(mobTablePath .. ".onMobSpawn", function(mob)
            debugPrint("onMobSpawn override called for " .. mob:getName())
            -- Call original onMobSpawn if it exists
            pcall(function() super(mob) end)

            -- Disable spell casting
            mob:setMobMod(xi.mobMod.SPELL_LIST, 0)
            mob:setMagicCastingEnabled(false)

            -- Guard against double execution using a local var which is immediate
            if spawnedMobs[mob:getID()] then
                return
            end
            spawnedMobs[mob:getID()] = true

            local function attemptSetup(m, attempts)
                local zone = m:getZone()
                if not zone then return end
                local confrontationID = zone:getLocalVar("ActiveHTBF_ConfrontationID")
                if confrontationID > 0 and xi.confrontation.lookup and xi.confrontation.lookup[confrontationID] then
                    local lookup = xi.confrontation.lookup[confrontationID]
                    -- Add confrontation status to mob
                    m:addStatusEffect(xi.effect.CONFRONTATION, { power = confrontationID, origin = m })
                    m:setLocalVar("DifficultyIndex", lookup.difficultyIndex)
                    debugPrint("Applied Confrontation ID " .. confrontationID .. " to Alexander.")

                    local function ensureConfrontation(mobRef, tries)
                        if not mobRef or not mobRef:isAlive() then return end

                        local z = mobRef:getZone()
                        if not z or z:getLocalVar("ActiveHTBF_ConfrontationID") ~= confrontationID then
                            return
                        end

                        if not mobRef:hasStatusEffect(xi.effect.CONFRONTATION) then
                            debugPrint("Confrontation effect missing on " .. mobRef:getName() .. ". Re-applying. Attempts left: " .. tries)
                            mobRef:addStatusEffect(xi.effect.CONFRONTATION, { power = confrontationID, origin = mobRef })
                        end
                        applyMobMods(mobRef, lookup)
                        if tries > 0 then
                            mobRef:timer(1000, function(m2)
                                if m2 and m2:isAlive() and not m2:hasStatusEffect(xi.effect.CONFRONTATION) then
                                    ensureConfrontation(m2, tries - 1)
                                end
                            end)
                        end
                    end

                    m:timer(500, function(m2)
                        ensureConfrontation(m2, 5)
                    end)

                    -- Mob is now spawned, start the check timer.
                    checkConfrontation(confrontationID)
                    debugPrint("Confrontation check timer started from onMobSpawn.")
                else
                    if attempts > 0 then
                        debugPrint("Confrontation ID not found yet for Alexander. Retrying... " .. attempts)
                        m:timer(500, function(m2) attemptSetup(m2, attempts - 1) end)
                    else
                        debugPrint("Failed to setup confrontation for Alexander.")
                    end
                end
            end

            attemptSetup(mob, 5)

            mob:addListener('WEAPONSKILL_STATE_ENTER', 'WS_START_MSG', function(mobArg, skillID)
                local skillMessage = {
                    [xi.mobSkill.RADIANT_SACRAMENT]  = { "Offer thy worship... I shall burn away...thy transgressions..." },
                    [xi.mobSkill.MEGA_HOLY]          = { "Open thine eyes... My radiance...shall guide thee..." },
                    [xi.mobSkill.PERFECT_DEFENSE]    = { "Cease thy struggles... I am immutable...indestructible...impervious...immortal..." },
                    [xi.mobSkill.DIVINE_SPEAR]       = { "Release thy self... My divine flames...shall melt thy flesh...sear thy bones...unshackle thy soul..." },
                    [xi.mobSkill.GOSPEL_OF_THE_LOST] = { "Bask in my glory... Mine existence...stretches into infinity..." },
                    [xi.mobSkill.VOID_OF_REPENTANCE] = { "Repent thy irreverence... The gate to salvation...lies before thee... Revelation...is within thy reach..." },
                    [xi.mobSkill.DIVINE_JUDGMENT]    = { "Accept thy destruction... Wish for eternity...yearn for immortality... Sense thy transience...know thy insignificance..."},
                }

                if skillMessage[skillID] then
                    local target = mobArg:getTarget()
                    if target and (target:isPet() or target:isTrust()) then target = target:getMaster() end
                    if target and target:isPC() then
                        local party = target:getParty() or { target }
                        for _, member in ipairs(party) do
                            for _, msg in ipairs(skillMessage[skillID]) do
                                member:printToPlayer(msg, xi.msg.channel.SYSTEM_3)
                            end
                        end
                    end
                end
            end)

            mob:addListener('GAIN_EFFECT', 'HTBF_GAIN_EFFECT', function(mobArg, effect)
                local effectId = effect:getEffectType()
                
                -- Stoneskin Removal for Combo (Difficult/Very Difficult)
                if effectId == xi.effect.STONESKIN and mobArg:getLocalVar("RemoveGospelStoneskin") == 1 then
                    mobArg:delStatusEffect(xi.effect.STONESKIN)
                    mobArg:setLocalVar("RemoveGospelStoneskin", 0)
                    return
                end
            end)

            mob:addListener('TAKE_DAMAGE', 'HTBF_TAKE_DAMAGE', function(mobArg, damage, attacker, attackType, damageType)
                -- Check for Skillchain damage (xi.attackType.SKILLCHAIN or fallback to 4/Special)
                if attackType == (xi.attackType.SKILLCHAIN or 4) then
                     local scCount = mobArg:getLocalVar("SCCount") + 1
                     if scCount >= 5 then
                         mobArg:useMobAbility(xi.mobSkill.PERFECT_DEFENSE)
                         scCount = 0
                     else
                         mobArg:useMobAbility(xi.mobSkill.VOID_OF_REPENTANCE)
                     end
                     mobArg:setLocalVar("SCCount", scCount)
                end

                -- Combo Cancel Logic (Difficult/Very Difficult)
                if mobArg:getLocalVar("ComboCharging") == 1 then
                    local threshold = mobArg:getLocalVar("ComboDmgThreshold")
                    if damage > threshold then
                        mobArg:setLocalVar("ComboCharging", 0)
                        -- mobArg:showText(mobArg, "Alexander's concentration is broken!")
                    end
                end
            end)

        end)

        m:addOverride(mobTablePath .. ".onMobSkillCheck", function(target, mob, skill)
            local skillId = skill:getID()
            local difficulty = mob:getLocalVar("DifficultyIndex")
            if difficulty == 0 then difficulty = 3 end

            -- Check permissions
            local perm = config.mobAbilityPermissions[skillId]
            if perm and not perm.difficulties[difficulty] then
                return 1 -- Deny skill
            end

            -- Prevent natural usage of Gospel of the Lost
            if skillId == xi.mobSkill.GOSPEL_OF_THE_LOST then
                if mob:getLocalVar("ForceGospel") ~= 1 then
                    return 1 -- Deny if not forced
                end
            end

            return 0 -- Allow
        end)

        m:addOverride(mobTablePath .. ".onMobWeaponSkill", function(target, mob, skill)
            local skillID = skill:getID()

            -- Track Gospel usage
            if skillID == xi.mobSkill.GOSPEL_OF_THE_LOST then
                mob:eraseAllStatusEffect()
                for _, effectId in pairs(debuffEffects) do
                    mob:delStatusEffect(effectId)
                end
                mob:setLocalVar("ForceGospel", 0)
                local gospelCount = mob:getLocalVar("GospelCount") + 1
                if gospelCount >= 3 then
                    if math.random(1, 100) <= 33 then
                        mob:setLocalVar("NextMovePerfectDefense", 1)
                    end
                    gospelCount = 0
                end
                mob:setLocalVar("GospelCount", gospelCount)
            elseif skillID == xi.mobSkill.PERFECT_DEFENSE then
                mob:addStatusEffect(xi.effect.PHYSICAL_SHIELD, { power = 1, duration = 30, origin = mob, icon = 0 })
                mob:addStatusEffect(xi.effect.ARROW_SHIELD, { power = 1, duration = 30, origin = mob, icon = 0 })
                mob:addStatusEffect(xi.effect.MAGIC_SHIELD, { power = 1, duration = 30, origin = mob, icon = 0 })
            end
        end)

        m:addOverride(mobTablePath .. ".onMobEngage", function(mob, target)
            debugPrint("onMobEngage called for " .. mob:getName())
            
            local zone = mob:getZone()
            if zone then
                zone:setLocalVar("HTBF_Mob_Engaged", 1)
                debugPrint("HTBF_Mob_Engaged set to 1 for Alexander.")
            end

            -- Call original onMobEngage if it exists
            pcall(function() super(mob, target) end)

            if target and (target:isPet() or target:isTrust()) then target = target:getMaster() end
            if target and target:isPC() then
                -- Ensure message only plays once per spawn
                if engagedMobs[mob:getID()] then
                    return
                end
                engagedMobs[mob:getID()] = true

                local party = target:getParty() or { target }
                for _, member in ipairs(party) do
                    member:printToPlayer("I am...Alexander... The meek...shall be rewarded... The defiant...shall be judged...", xi.msg.channel.SYSTEM_3)
                end
            end
        end)

        m:addOverride(mobTablePath .. ".onMobDisengage", function(mob)
            local zone = mob:getZone()
            if zone then
                local confrontationID = zone:getLocalVar("ActiveHTBF_ConfrontationID")
                if confrontationID > 0 and xi.confrontation.lookup and xi.confrontation.lookup[confrontationID] then
                    local lookup = xi.confrontation.lookup[confrontationID]
                    local anyAlive = false
                    local anyInZone = false
                    for _, pid in ipairs(lookup.registeredPlayerIds) do
                        local p = GetPlayerByID(pid)
                        if p and p:getZoneID() == zone:getID() then
                            anyInZone = true
                            if p:isAlive() then
                                anyAlive = true
                                break
                            end
                        end
                    end

                    if anyAlive then
                        debugPrint("onMobDisengage: Players still alive, skipping despawn.")
                        return
                    end

                    if anyInZone then
                        debugPrint("onMobDisengage: Players wiped but still in zone. Skipping despawn.")
                        return
                    end
                end
            end

            debugPrint("onMobDisengage called for " .. mob:getName() .. ". Despawning to prevent exploit.")
            -- If mob disengages (wipe/disconnect), force despawn to clean up the instance
            -- This triggers onMobDeath/Despawn logic which handles the confrontation cleanup
            spawnedMobs[mob:getID()] = nil
            engagedMobs[mob:getID()] = nil
            DespawnMob(mob:getID())
        end)

        m:addOverride(mobTablePath .. ".onMobFight", function(mob, target)
            local difficulty = mob:getLocalVar("DifficultyIndex")
            if difficulty == 0 then difficulty = 3 end
            local hpp = mob:getHPP()

            -- Normal (3): Divine Judgment at 15%
            if difficulty == 3 then
                if hpp <= 15 and mob:getLocalVar("DJ_15") == 0 then
                    mob:setLocalVar("DJ_15", 1)
                    mob:useMobAbility(xi.mobSkill.DIVINE_JUDGMENT)
                end
            end

            -- Difficult (4) & Very Difficult (5): Combo at 85, 70, 50, 30, 15
            if difficulty >= 4 then
                local thresholds = {85, 70, 50, 30, 15}
                for _, t in ipairs(thresholds) do
                    local varName = "Combo_" .. t
                    if hpp <= t and mob:getLocalVar(varName) == 0 then
                        mob:setLocalVar(varName, 1)
                        
                        -- Start Charging
                        mob:setLocalVar("ComboCharging", 1)
                        local dmgThreshold = (difficulty == 4) and 15000 or 20000
                        mob:setLocalVar("ComboDmgThreshold", dmgThreshold)
                        
                        -- Timer to fire (4 seconds)
                        mob:timer(4000, function(m)
                            if m:getLocalVar("ComboCharging") == 1 then
                                m:setLocalVar("ComboCharging", 0)
                                -- Fire Combo
                                m:useMobAbility(xi.mobSkill.DIVINE_JUDGMENT)
                                
                                -- Queue Gospel after DJ (2 seconds later)
                                m:timer(2000, function(m2)
                                    m2:setLocalVar("RemoveGospelStoneskin", 1)
                                    m2:setLocalVar("ForceGospel", 1)
                                    m2:useMobAbility(xi.mobSkill.GOSPEL_OF_THE_LOST)
                                end)
                            end
                        end)
                    end
                end
            end

            -- Debuff Response Logic (Active Scan)
            local threshold = 1
            if difficulty == 1 then threshold = 6      -- Very Easy
            elseif difficulty == 2 then threshold = 3  -- Easy
            end

            local debuffCount = 0
            local activeDebuffs = ""

            -- Debug: Print all effects currently on the mob to verify IDs
            local allEffects = mob:getStatusEffects()
            for _, effect in pairs(allEffects) do
                debugPrint(string.format("Mob has effect ID: %d", effect:getEffectType()))
            end

            for _, effectId in pairs(debuffEffects) do
                if mob:hasStatusEffect(effectId) then
                    debuffCount = debuffCount + 1
                    activeDebuffs = activeDebuffs .. tostring(effectId) .. ","
                end
            end

            debugPrint(string.format("Alexander Debuff Check: Count=%d, Threshold=%d, Action=%d, Active: %s", debuffCount, threshold, mob:getCurrentAction(), activeDebuffs))

            if debuffCount >= threshold and mob:getLocalVar("GospelPending") == 0 and mob:getLocalVar("ForceGospel") == 0 then
                local cooldown = mob:getLocalVar("GospelCooldown")
                if os.time() > cooldown then
                    debugPrint("Triggering Gospel of the Lost in 3 seconds!")
                    mob:setLocalVar("GospelPending", 1)
                    mob:timer(3000, function(m)
                        if m and m:isAlive() then
                            m:setLocalVar("ForceGospel", 1)
                            m:useMobAbility(xi.mobSkill.GOSPEL_OF_THE_LOST)
                            m:eraseAllStatusEffect()
                            for _, effectId in pairs(debuffEffects) do
                                m:delStatusEffect(effectId)
                            end
                            -- Reset pending after a delay to allow ability to go off and clear debuffs
                            m:timer(5000, function(m2)
                                if m2 and m2:isAlive() then m2:setLocalVar("GospelPending", 0) end
                            end)
                            m:setLocalVar("GospelCooldown", os.time() + 15)
                        end
                    end)
                end
            end

            if mob:getLocalVar("NextMovePerfectDefense") == 1 and mob:getCurrentAction() <= 1 then
                mob:setLocalVar("NextMovePerfectDefense", 0)
                mob:useMobAbility(xi.mobSkill.PERFECT_DEFENSE)
            end

            -- ffxiclopedia: 'In addition to this, it's possible he'll use it several times again at low (5%?) HP.'
            -- Per same wiki, may use Perfect Defense as a regular skill at 10%..Assuming same % for both skills.
            local skillList = mob:getMobMod(xi.mobMod.SKILL_LIST)
            if mob:getHPP() <= 10 and skillList == 784 then
                mob:setMobMod(xi.mobMod.SKILL_LIST, 785) -- Alexander_LowHP
            end

            local drawInTable =
            {
                conditions =
                {
                    mob:checkDistance(target) > 20,
                },
                position = mob:getPos(),
            }
            utils.drawIn(target, drawInTable)
        end)

        m:addOverride(mobTablePath .. ".onMobDeath", function(mob, player, optParams)
            debugPrint("onMobDeath called for " .. mob:getName())
            
            spawnedMobs[mob:getID()] = nil
            engagedMobs[mob:getID()] = nil

            -- Ensure we have the real player, not a pet or trust
            if player and (player:isPet() or player:isTrust()) then
                player = player:getMaster()
            end

            if optParams.isKiller and player then
                player:printToPlayer("I am...Alexander... The fearful...shall be embraced... The bold...shall know oblivion...", xi.msg.channel.SYSTEM_3)

                -- Find the confrontation ID from any player in the party
                local confrontationID = 0
                local party = player:getParty() or {player}
                for _, p_member in ipairs(party) do
                    if p_member:getCharVar("HTBF_ConfrontationID") > 0 then
                        confrontationID = p_member:getCharVar("HTBF_ConfrontationID")
                        break
                    end
                end

                if confrontationID > 0 and xi.confrontation.lookup[confrontationID] then
                     -- Remove mob from lookup so check function knows it's dead
                     xi.confrontation.lookup[confrontationID].mobIds = {}
                     -- The check function will handle the win logic
                     -- The check function will handle the win logic (validMobCount will be 0 because isAlive is false)
                     checkConfrontation(confrontationID)
                else
                    debugPrint("Could not find active confrontation for this battle.")
                end
            end
        end)
    end
end

return setup