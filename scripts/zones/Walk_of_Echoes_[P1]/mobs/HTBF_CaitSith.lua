-----------------------------------
-- Cait Sith HTBF Logic
-----------------------------------

-- Configuration: Number of debuffs required to trigger Divine Favor (Skill 2451) per difficulty
local divineFavorThresholds = {
    [1] = 4, -- Very Easy
    [2] = 4, -- Easy
    [3] = 2, -- Normal
    [4] = 2, -- Difficult
    [5] = 1, -- Very Difficult
}

-- Configuration: HP % threshold to trigger Benediction (Skill 1010) per difficulty
local benedictionThresholds = {
    [1] = 35, -- Very Easy
    [2] = 35, -- Easy
    [3] = 20, -- Normal
    [4] = 15, -- Difficult
    [5] = 10, -- Very Difficult
}

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

local spawnedMobs = {}

local function setup(m, config, helpers)
    local debugPrint = helpers.debugPrint
    local ensureTable = helpers.ensureTable
    local applyMobMods = helpers.applyMobMods
    local checkConfrontation = helpers.checkConfrontation

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
            pcall(function() super(mob) end)

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
                    m:addStatusEffect(xi.effect.CONFRONTATION, { power = confrontationID, origin = m })
                    m:setLocalVar("DifficultyIndex", lookup.difficultyIndex)
                    debugPrint("Applied Confrontation ID " .. confrontationID .. " to Cait Sith.")

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

                    checkConfrontation(confrontationID)
                    m:setUnkillable(true)
                    m:setLocalVar("BenedictionUsed", 0)
                    m:setLocalVar("BenedictionPending", 0)
                else
                    if attempts > 0 then
                        debugPrint("Confrontation ID not found yet for Cait Sith. Retrying... " .. attempts)
                        m:timer(500, function(m2) attemptSetup(m2, attempts - 1) end)
                    else
                        debugPrint("Failed to setup confrontation for Cait Sith.")
                    end
                end
            end

            attemptSetup(mob, 5)
        end)

        m:addOverride(mobTablePath .. ".onMobEngage", function(mob, target)
            local zone = mob:getZone()
            if zone then
                zone:setLocalVar("HTBF_Mob_Engaged", 1)
                debugPrint("HTBF_Mob_Engaged set to 1 for Cait Sith.")
            end
            pcall(function() super(mob, target) end)
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
            spawnedMobs[mob:getID()] = nil
            DespawnMob(mob:getID())
        end)

        m:addOverride(mobTablePath .. ".onMobFight", function(mob, target)
            local difficulty = mob:getLocalVar("DifficultyIndex")
            if difficulty == 0 then difficulty = 3 end -- Default Normal

            local beneThreshold = benedictionThresholds[difficulty] or 10
            if mob:getHPP() <= beneThreshold and mob:getLocalVar("BenedictionUsed") == 0 then
                local currentTime = os.time()
                if currentTime >= mob:getLocalVar("NextBeneCheckTime") then
                    mob:setLocalVar("NextBeneCheckTime", currentTime + 3)
                    if mob:getLocalVar("BenedictionPending") == 0 or currentTime > mob:getLocalVar("BenedictionPendingTime") + 10 then
                        if math.random(1, 100) <= 25 and mob:getCurrentAction() <= 1 then
                            mob:setLocalVar("BenedictionPending", 1)
                            mob:setLocalVar("BenedictionPendingTime", currentTime)
                            mob:useMobAbility(1010) -- Benediction
                        end
                    end
                end
            end

            local threshold = divineFavorThresholds[difficulty] or 1
            local debuffCount = 0
            local activeDebuffs = ""

            -- Debug: Print all effects currently on the mob to verify IDs
            local allEffects = mob:getStatusEffects()
            for _, effect in pairs(allEffects) do
                debugPrint(string.format("Cait Sith has effect ID: %d", effect:getEffectType()))
            end

            for _, effectId in pairs(debuffEffects) do
                if mob:hasStatusEffect(effectId) then
                    debuffCount = debuffCount + 1
                    activeDebuffs = activeDebuffs .. tostring(effectId) .. ","
                end
            end

            debugPrint(string.format("Cait Sith Debuff Check: Count=%d, Threshold=%d, Action=%d, Active: %s", debuffCount, threshold, mob:getCurrentAction(), activeDebuffs))

            if debuffCount >= threshold and mob:getLocalVar("DivineFavorPending") == 0 and mob:getLocalVar("DivineFavor") == 0 then
                debugPrint("Triggering Divine Favor in 3 seconds!")
                mob:setLocalVar("DivineFavorPending", 1)
                mob:timer(5000, function(m)
                    if m and m:isAlive() then
                        m:useMobAbility(2451) -- Divine Favor
                        m:eraseAllStatusEffect()
                        -- Reset pending after a delay to allow ability to go off and clear debuffs
                        m:timer(5000, function(m2)
                            if m2 and m2:isAlive() then m2:setLocalVar("DivineFavorPending", 0) end
                        end)
                    end
                end)
            end
        end)

        m:addOverride(mobTablePath .. ".onMobWeaponSkill", function(target, mob, skill)
            if skill:getID() == 1010 then -- Benediction
                mob:setUnkillable(false)
                mob:setLocalVar("BenedictionUsed", 1)
            end
        end)

        m:addOverride(mobTablePath .. ".onMobDeath", function(mob, player, optParams)
            debugPrint("onMobDeath called for " .. mob:getName())
            
            spawnedMobs[mob:getID()] = nil

            if player and (player:isPet() or player:isTrust()) then
                player = player:getMaster()
            end

            if optParams.isKiller and player then
                local confrontationID = 0
                local party = player:getParty() or {player}
                for _, p_member in ipairs(party) do
                    if p_member:getCharVar("HTBF_ConfrontationID") > 0 then
                        confrontationID = p_member:getCharVar("HTBF_ConfrontationID")
                        break
                    end
                end

                if confrontationID > 0 and xi.confrontation.lookup[confrontationID] then
                     xi.confrontation.lookup[confrontationID].mobIds = {}
                     checkConfrontation(confrontationID)
                end
            end
        end)
    end
end

return setup