-----------------------------------
-- Area: Zone 210 (Abyssea - Misareaux)
-- Mob: Matsui-P (Permanent Nightmare Edition)
-----------------------------------
local mobObject = {}

-- onMobSpawn sets up all the baseline stats so you don't need to change SQL values
mobObject.onMobSpawn = function(mob)
    -- Init local variables
    mob:setLocalVar("lastShadowTime", 0)
    mob:setLocalVar("lastUtilityTime", 0)
    mob:setLocalVar("statScalingTier", 0)
    mob:setLocalVar("lastWarnTime", 0)

    -- Primary Stats
    mob:addMod(xi.mod.STR, 60)
    mob:addMod(xi.mod.DEX, 60)
    mob:addMod(xi.mod.AGI, 60)
    mob:addMod(xi.mod.VIT, 30)
    mob:addMod(xi.mod.INT, 60)
    mob:addMod(xi.mod.MND, 30)
    mob:addMod(xi.mod.CHR, 1200)

    -- Combat Performance
    mob:setMod(xi.mod.ATT, 120)
    mob:setMod(xi.mod.ACC, 3600)
    mob:setMod(xi.mod.MDEF, 100)
    mob:setMod(xi.mod.MEVA, 900)
    mob:setMod(xi.mod.EVA, 250)
    mob:addMod(xi.mod.MACC, 3600)
    mob:setMod(xi.mod.MATT, 150)
    mob:addMod(xi.mod.WSACC, 3600)

    -- Immunities and Status Resistances
    mob:setMod(xi.mod.SILENCERES, 100)
    mob:setMod(xi.mod.STUNRES, 50)
    mob:setMod(xi.mod.BINDRES, 100)
    mob:setMod(xi.mod.GRAVITYRES, 100)
    mob:setMod(xi.mod.SLEEPRES, 100)
    mob:setMod(xi.mod.POISONRES, 100)
    mob:setMod(xi.mod.PARALYZERES, 100)
    mob:setMod(xi.mod.LULLABYRES, 100)

    -- Elemental Resistances
    mob:setMod(xi.mod.FIRE_SDT, 170)
    mob:setMod(xi.mod.ICE_SDT, 170)
    mob:setMod(xi.mod.WIND_SDT, 170)
    mob:setMod(xi.mod.EARTH_SDT, 170)
    mob:setMod(xi.mod.THUNDER_SDT, 170)
    mob:setMod(xi.mod.WATER_SDT, 170)
    mob:setMod(xi.mod.LIGHT_SDT, 170)
    mob:setMod(xi.mod.DARK_SDT, 200)

    -- Attack Traits
    mob:setMod(xi.mod.DOUBLE_ATTACK, 40)
    mob:setMod(xi.mod.TRIPLE_ATTACK, 15)
    mob:setMod(xi.mod.FASTCAST, 100)
end

-----------------------------------
-- 1. Evil Damage Listener
-----------------------------------
mobObject.onMobDamage = function(mob, attacker, damage, attackType, damageType)
    local now = os.time()
    
    -- Scan slots for augments: Head, Body, Hands, Legs, Feet
    local armorSlots = {
        xi.slot.HEAD, xi.slot.BODY, xi.slot.HANDS, xi.slot.LEGS, xi.slot.FEET
    }

    local augmentCount = 0
    for _, slot in ipairs(armorSlots) do
        local item = attacker:getEquippedItem(slot)
        if item then
            local extData = item:getExtData()
            if extData and extData[1] ~= 0 then
                augmentCount = augmentCount + 1
            end
        end
    end

    -- REACTION A: The "Augment Tax" (Stat Buffs + Player TP Drain)
    if augmentCount > 0 then
        mob:addMod(xi.mod.EVA, augmentCount * 50)
        mob:addMod(xi.mod.DEF, augmentCount * 60)
        mob:addMod(xi.mod.DMGPHYS, augmentCount * -300)

        local playerTP = attacker:getTP()
        local tpDrain = augmentCount * 100
        attacker:setTP(math.max(0, playerTP - tpDrain))

        if attacker.printToPlayer and mob:getLocalVar("lastWarnTime") ~= now then
            attacker:printToPlayer(string.format(
                "Matsui-P punishes your gear! Drained %d TP and boosted his defenses.", 
                tpDrain
            ))
            mob:setLocalVar("lastWarnTime", now)
        end
    end

    -- REACTION B: High Damage Adaptive Scaling (Over 1k damage)
    if damage > 1000 then
        local currentTier = mob:getLocalVar("statScalingTier")
        if currentTier < 5 then
            currentTier = currentTier + 1
            mob:setLocalVar("statScalingTier", currentTier)
            
            -- Physical reductions crank up
            mob:addMod(xi.mod.SDT_SLASH, -2200)
            mob:addMod(xi.mod.SDT_PIERCE, -2200)
            mob:addMod(xi.mod.SDT_IMPACT, -2200)
            
            -- Increases casting and attack speed exponentially.
            mob:addMod(xi.mod.HASTE_MAGIC, 500)
            mob:addMod(xi.mod.REGAIN, 20)

            -- Emergency Reset if below 40% HP
            if mob:getHPP() < 40 then
                mob:setLocalVar("lastUtilityTime", 0)
                if attacker.printToPlayer then
                    attacker:printToPlayer("Your heavy hit triggers Matsui-P's survival instincts! He's ready to heal.")
                end
            end
        end
    end
end

-----------------------------------
-- 2. Combat Loop
-----------------------------------
mobObject.onMobFight = function(mob, target)
    local hpp = mob:getHPP()
    local tp = mob:getTP()
    local now = os.time()

    local lastShadow = mob:getLocalVar("lastShadowTime")
    local lastUtility = mob:getLocalVar("lastUtilityTime")

    -- Shadows (15s Window)
    if now > lastShadow + 15 then
        if not mob:hasStatusEffect(xi.effect.COPY_IMAGE) then
            -- Priority check: Cast San if available, fallback to Ni
            if xi.magic.spell.UTSUSEMI_SAN then
                mob:castSpell(xi.magic.spell.UTSUSEMI_SAN, target)
            else
                mob:castSpell(xi.magic.spell.UTSUSEMI_NI, target)
            end
            mob:setLocalVar("lastShadowTime", now)
            return 
        end
    end

    -- Healing/Utility Window
    if now > lastUtility + 60 then
        if hpp < 50 and tp >= 500 then
            mob:useJobAbility(xi.jobAbility.CURING_WALTZ_V, mob)
            mob:setLocalVar("lastUtilityTime", now)
            return
        elseif not mob:hasStatusEffect(xi.effect.DRAIN_SAMBA) and tp >= 100 then
            mob:useJobAbility(xi.jobAbility.DRAIN_SAMBA_III, mob)
            mob:setLocalVar("lastUtilityTime", now)
            return
        end
    end
end

return mobObject