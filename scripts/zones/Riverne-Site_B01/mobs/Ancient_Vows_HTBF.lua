-----------------------------------
-- Area: Riverne-Site #B01
-- HTBF: Ancient Vows (Mammet-19 Epsilon mechanics)
-----------------------------------
local htbf = {}

local forms =
{
    UNARMED = 0,
    SWORD   = 1,
    POLEARM = 2,
    STAFF   = 3,
}

local tpMoves =
{
    [forms.UNARMED] =
    {
        xi.mobSkill.TRANSMOGRIFICATION,
        xi.mobSkill.TREMOROUS_TREAD,
    },
    [forms.SWORD] =
    {
        xi.mobSkill.VELOCIOUS_BLADE,
        xi.mobSkill.SONIC_BLADE,
        xi.mobSkill.SCISSION_THRUST,
    },
    [forms.POLEARM] =
    {
        xi.mobSkill.PERCUSSIVE_FOIN,
        xi.mobSkill.GRAVITY_WHEEL,
        xi.mobSkill.MICROQUAKE,
    },
    [forms.STAFF] =
    {
        xi.mobSkill.PSYCHOMANCY,
        xi.mobSkill.MIND_WALL,
    },
}

local function applyMammetMods(mob, lookup)
    if mob:getLocalVar("Custom_HTBF_Mods_Applied") == 1 then return end
    mob:setLocalVar("Custom_HTBF_Mods_Applied", 1)

    if lookup.mobLevel then mob:setMobLevel(lookup.mobLevel) end
    if lookup.hppMod then
        mob:addMod(xi.mod.HPP, lookup.hppMod)
        mob:updateHealth()
        mob:setHP(mob:getMaxHP())
    end

    local multiplier = lookup.statModMultiplier or 1.0
    if lookup.mobMods then
        for _, modData in ipairs(lookup.mobMods) do
            local val = modData.val
            local modID = modData.mod
            local targetVal = math.floor(val * multiplier)

            if modData.target then
                local current = 0
                if modID == xi.mod.STR then current = mob:getStat(xi.mod.STR)
                elseif modID == xi.mod.DEX then current = mob:getStat(xi.mod.DEX)
                elseif modID == xi.mod.VIT then current = mob:getStat(xi.mod.VIT)
                elseif modID == xi.mod.AGI then current = mob:getStat(xi.mod.AGI)
                elseif modID == xi.mod.INT then current = mob:getStat(xi.mod.INT)
                elseif modID == xi.mod.MND then current = mob:getStat(xi.mod.MND)
                elseif modID == xi.mod.CHR then current = mob:getStat(xi.mod.CHR)
                elseif modID == xi.mod.ATT then current = mob:getStat(xi.mod.ATT)
                elseif modID == xi.mod.DEF then current = mob:getStat(xi.mod.DEF)
                elseif modID == xi.mod.ACC then current = mob:getMod(xi.mod.ACC)
                elseif modID == xi.mod.EVA then current = mob:getStat(xi.mod.EVA)
                elseif modID == xi.mod.RATT then current = mob:getMod(xi.mod.RATT)
                elseif modID == xi.mod.RACC then current = mob:getMod(xi.mod.RACC)
                elseif modID == xi.mod.MATT then current = mob:getMod(xi.mod.MATT)
                elseif modID == xi.mod.MACC then current = mob:getMod(xi.mod.MACC)
                elseif modID == xi.mod.MEVA then current = mob:getMod(xi.mod.MEVA)
                elseif modID == xi.mod.MDEF then current = mob:getMod(xi.mod.MDEF)
                end
                local diff = targetVal - current
                mob:addMod(modID, diff)
            elseif modData.set then
                mob:setMod(modID, targetVal)
            else
                mob:addMod(modID, targetVal)
            end
        end
    end
end

local function spawnMammet(zone, x, y, z, rot, confID, diffIndex)
    local mob = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = "Mammet",
        look = '0600ed0300000000000000000000000000000000',
        groupId = 1,
        groupZoneId = 31,
        minLevel = 119,
        maxLevel = 119,
        modelSize = 5,

        onMobSpawn = function(mob)
            mob:addImmunity(xi.immunity.DARK_SLEEP)
            mob:addImmunity(xi.immunity.LIGHT_SLEEP)
            mob:setMobMod(xi.mobMod.SIGHT_RANGE, 20)
            mob:setMagicCastingEnabled(false)

            if confID > 0 and xi.confrontation and xi.confrontation.lookup[confID] then
                local lookup = xi.confrontation.lookup[confID]
                local config = xi.custom_htbf.configs[lookup.configIndex]
                local diff = config.difficulties[diffIndex]
                local combinedMobMods = {}
                if config.mobMods then for _, v in ipairs(config.mobMods) do table.insert(combinedMobMods, v) end end
                if diff.mobMods then for _, v in ipairs(diff.mobMods) do table.insert(combinedMobMods, v) end end
                applyMammetMods(mob, { mobLevel = diff.mobLevel, hppMod = diff.hppMod, statModMultiplier = diff.statModMultiplier, mobMods = combinedMobMods })
                table.insert(lookup.mobIds, mob:getID())
            end

            mob:setMobMod(xi.mobMod.NO_MOVE, 1)
            mob:setAutoAttackEnabled(false)

            local zone = mob:getZone()
            if zone then
                zone:setLocalVar("AncientVows_AliveCount", zone:getLocalVar("AncientVows_AliveCount") + 1)
                local confID = zone:getLocalVar("ActiveCustomHTBF_ConfrontationID")
                if confID > 0 then
                    mob:addStatusEffect(xi.effect.CONFRONTATION, { power = confID, origin = mob })
                    local effect = mob:getStatusEffect(xi.effect.CONFRONTATION)
                    if effect then effect:delEffectFlag(xi.effectFlag.DEATH) end
                end
            end
        end,

        onMobEngage = function(mob, target)
            mob:setMobMod(xi.mobMod.NO_MOVE, 0)
            mob:setAutoAttackEnabled(true)
        end,

        onMobDeath = function(mob, player, optParams)
            local zone = mob:getZone()
            if zone then
                local aliveCount = zone:getLocalVar("AncientVows_AliveCount") - 1
                zone:setLocalVar("AncientVows_AliveCount", aliveCount)

                if aliveCount <= 0 then
                    local confID = zone:getLocalVar("ActiveCustomHTBF_ConfrontationID")
                    if confID > 0 and xi.confrontation and xi.confrontation.lookup[confID] then
                        xi.confrontation.lookup[confID].mobIds = {}
                        xi.confrontation.lookup[confID].isSpawning = false
                    end
                end
            end
        end,

        onMobFight = function(mob, target)
            local timeTracker = mob:getLocalVar('formTimeTracker')
            local currentTime = mob:getBattleTime()
            local cannotChangeForm = mob:hasStatusEffect(xi.effect.FOOD)

            if currentTime >= timeTracker and not cannotChangeForm then
                local rand = math.random(0, 3)
                mob:setAnimationSub(rand)
                switch (rand): caseof
                {
                    [forms.UNARMED] = function() mob:setMagicCastingEnabled(false) mob:setDelay(2400) mob:setDamage(40) end,
                    [forms.SWORD]   = function() mob:setMagicCastingEnabled(false) mob:setDelay(1500) mob:setDamage(40) end,
                    [forms.POLEARM] = function() mob:setMagicCastingEnabled(false) mob:setDelay(3250) mob:setDamage(75) end,
                    [forms.STAFF]   = function() mob:setMobMod(xi.mobMod.MAGIC_COOL, 20) mob:setMagicCastingEnabled(true) mob:setDelay(3700) mob:setDamage(40) end,
                }
                mob:setLocalVar('formTimeTracker', mob:getBattleTime() + math.random(30, 60))
            end
        end,

        onMobMobskillChoose = function(mob, target, skillId)
            local form  = mob:getAnimationSub()
            local moves = tpMoves[form] or tpMoves[forms.UNARMED]
            return moves[math.random(1, #moves)]
        end,

        releaseIdOnDisappear = true,
    })

    if mob then
        mob:setSpawn(x, y, z, rot)
        mob:spawn()
    end
end

htbf.spawn = function(zone, confID, diffIndex)
    zone:setLocalVar("AncientVows_AliveCount", 0)

    local offsets = {
        { 0, 0 },
        { 2, 0 },
        { -2, 0 },
        { 0, 2 },
        { 0, -2 },
        { 2, 2 }
    }

    for _, offset in ipairs(offsets) do
        local x = 690.5494 + offset[1]
        local y = -23.1888
        local z = 385.1294 + offset[2]
        spawnMammet(zone, x, y, z, 24, confID, diffIndex)
    end

    if confID > 0 and xi.confrontation.lookup[confID] then
        xi.confrontation.lookup[confID].isSpawning = false
    end
end

return htbf