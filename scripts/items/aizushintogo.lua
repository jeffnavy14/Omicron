-----------------------------------
-- Aizushintogo
-- Adds Attack +5 per active Utsusemi shadow
-----------------------------------

local itemObject = {}

local function updateShadows(target, item)
    local itemId = item:getID()
    local count = 0

    -- Check if equipped in Main or Sub (to account for Dual Wielding)
    if target:getEquipID(xi.slot.MAIN) == itemId then
        count = count + 1
    end

    if target:getEquipID(xi.slot.SUB) == itemId then
        count = count + 1
    end

    -- xi.mod.UTSUSEMI tracks the current number of active Utsusemi shadows
    local shadows = target:getMod(xi.mod.UTSUSEMI)
    local desiredBonus = shadows * 5 * count
    local currentBonus = target:getLocalVar("Aizushintogo_Att_Bonus")

    -- Only update the modifier if the calculated bonus has changed
    if currentBonus ~= desiredBonus then
        target:delMod(xi.mod.ATT, currentBonus)
        target:addMod(xi.mod.ATT, desiredBonus)
        target:setLocalVar("Aizushintogo_Att_Bonus", desiredBonus)
    end
end

local function removeEffect(target)
    local currentBonus = target:getLocalVar("Aizushintogo_Att_Bonus")
    if currentBonus > 0 then
        target:delMod(xi.mod.ATT, currentBonus)
        target:setLocalVar("Aizushintogo_Att_Bonus", 0)
    end

    local activeFc = target:getLocalVar("Aizushintogo_FC_Active")
    if activeFc > 0 then
        target:delMod(xi.mod.FASTCAST, activeFc)
        target:setLocalVar("Aizushintogo_FC_Active", 0)
    end
end

itemObject.onItemCheck = function(target, item, param, caster)
    local itemId = item:getID()
    if target:getEquipID(xi.slot.MAIN) == itemId or target:getEquipID(xi.slot.SUB) == itemId then
        itemObject.onItemEquip(target, item, nil)
    end
    return 0
end

itemObject.onItemEquip = function(target, item, slot)
    local itemId = item:getID()
    local playerId = target:getID()
    local listenerId = "AIZUSHINTOGO_" .. playerId
    local precastListenerId = "AIZUSHINTOGO_PRECAST_" .. playerId

    if not target:hasListener(listenerId) then
        target:addListener("TICK", listenerId, function(p_tick)
            if p_tick:getEquipID(xi.slot.MAIN) ~= itemId and p_tick:getEquipID(xi.slot.SUB) ~= itemId then
                p_tick:removeListener(listenerId)
                p_tick:removeListener(precastListenerId)
                removeEffect(p_tick)
                return
            end
            updateShadows(p_tick, item)
        end)
    end

    if not target:hasListener(precastListenerId) then
        target:addListener("MAGIC_PRECAST", precastListenerId, function(caster, spell)
            if spell:getFamily() == xi.magic.spellFamily.UTSUSEMI then
                local count = 0
                if caster:getEquipID(xi.slot.MAIN) == itemId then count = count + 1 end
                if caster:getEquipID(xi.slot.SUB) == itemId then count = count + 1 end
                
                local desiredFcBonus = count * 7
                local currentFcBonus = caster:getLocalVar("Aizushintogo_FC_Active")
                
                if currentFcBonus ~= desiredFcBonus then
                    caster:delMod(xi.mod.FASTCAST, currentFcBonus)
                    if desiredFcBonus > 0 then
                        caster:addMod(xi.mod.FASTCAST, desiredFcBonus)
                    end
                    caster:setLocalVar("Aizushintogo_FC_Active", desiredFcBonus)
                end
                
                -- Set a timeout to safely remove Fast Cast shortly after the spell cast finishes or interrupts
                local castInstance = os.time()
                caster:setLocalVar("Aizushintogo_Cast_Instance", castInstance)
                caster:timer(4000, function(p)
                    if p:getLocalVar("Aizushintogo_Cast_Instance") == castInstance then
                        local activeFc = p:getLocalVar("Aizushintogo_FC_Active")
                        if activeFc > 0 then
                            p:delMod(xi.mod.FASTCAST, activeFc)
                            p:setLocalVar("Aizushintogo_FC_Active", 0)
                        end
                    end
                end)
            end
        end)
    end

    updateShadows(target, item)
end

itemObject.onItemUnequip = function(target, item, slot)
    -- We let the TICK listener handle the unequip removal seamlessly. 
    -- It will catch that the item is no longer in either slot and clean itself up on the next tick.
end

return itemObject