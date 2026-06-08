-----------------------------------
-- Gokotai Katana
-- Latent: Converts total Dual Wield into TP Regain (Cap 100)
-----------------------------------

local itemObject = {}

local function removeEffect(target)
    local regain = target:getLocalVar("GokotaiRegain")
    if regain > 0 then
        target:delMod(xi.mod.REGAIN, regain)
    end
    target:setLocalVar("GokotaiRegain", 0)
end

local function updateRegain(target)
    local playerId = target:getID()
    local oldRegain = target:getLocalVar("GokotaiRegain")
    local listenerId = "GOKOTAI_REGAIN_" .. playerId

    -- Check if offhand is equipped
    if target:getEquipID(xi.slot.SUB) == 0 then
        removeEffect(target)
        return
    end

    -- Get total Dual Wield
    local dualWield = target:getMod(xi.mod.DUAL_WIELD) or 0

    -- Cap TP regain at 100. Use math.abs since delay reduction mods are often negative.
    local newRegain = math.min(math.abs(dualWield), 100)

    if newRegain == oldRegain then
        return
    end

    -- Remove old regain value before recalculating
    if oldRegain > 0 then
        target:delMod(xi.mod.REGAIN, oldRegain)
    end

    -- Apply new TP regain
    if newRegain > 0 then
        target:addMod(xi.mod.REGAIN, newRegain)
        target:setLocalVar("GokotaiRegain", newRegain)
    else
        target:setLocalVar("GokotaiRegain", 0)
    end
end

itemObject.onItemCheck = function(target, item, param, caster)
    -- This function is called when the item is checked by the server,
    -- which includes zoning or logging in. It ensures the effect is active
    -- if the item is equipped.
    local playerId = target:getID()
    local itemId = item:getID()
    local listenerId = "GOKOTAI_REGAIN_" .. playerId

    -- Check if the item is equipped in the main hand AND the listener is missing.
    -- If the listener exists, onItemEquip/updateRegain is already handling it.
    if target:getEquipID(xi.slot.MAIN) == itemId and not target:hasListener(listenerId) then
        -- Forcefully re-run the equip logic to ensure the listener is active.
        itemObject.onItemEquip(target, item, xi.slot.MAIN)
    end
    return 0
end

itemObject.onItemEquip = function(target, item, slot)
    if slot ~= nil then
        if slot ~= xi.slot.MAIN then
            return
        end
    elseif target:getEquipID(xi.slot.MAIN) ~= item:getID() then
        return
    end

    local playerId = target:getID()
    local itemId = item:getID()
    local listenerId = "GOKOTAI_REGAIN_" .. playerId

    -- Only add the listener if it doesn't exist to prevent duplicates
    if not target:hasListener(listenerId) then
        target:addListener("TICK", listenerId, function(p_tick)
            -- Verify item is still equipped in main hand
            if p_tick:getEquipID(xi.slot.MAIN) ~= itemId then
                p_tick:removeListener(listenerId)
                removeEffect(p_tick)
                return
            end
            updateRegain(p_tick)
        end)
        
        -- Perform initial update immediately
        updateRegain(target)
    end
end

itemObject.onItemUnequip = function(target, item, slot)
    if slot ~= nil and slot ~= xi.slot.MAIN then
        return
    end

    local playerId = target:getID()
    local listenerId = "GOKOTAI_REGAIN_" .. playerId

    -- Remove the listener
    target:removeListener(listenerId)

    removeEffect(target)
end

return itemObject