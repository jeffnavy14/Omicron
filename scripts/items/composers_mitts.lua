-----------------------------------
-- Composer's Mitts
-- Adds Accuracy +50 while under the effect of Madrigal
-----------------------------------

local itemObject = {}

local function applyEffect(target)
    if target:getLocalVar("ComposersMadrigalAcc") == 0 then
        target:addMod(xi.mod.ACC, 50)
        target:setLocalVar("ComposersMadrigalAcc", 1)
    end
end

local function removeEffect(target)
    if target:getLocalVar("ComposersMadrigalAcc") > 0 then
        target:delMod(xi.mod.ACC, 50)
        target:setLocalVar("ComposersMadrigalAcc", 0)
    end
end

local function updateMadrigal(target)
    if target:hasStatusEffect(xi.effect.MADRIGAL) then
        applyEffect(target)
    else
        removeEffect(target)
    end
end

itemObject.onItemCheck = function(target, item, param, caster)
    -- This function is called when the item is checked by the server,
    -- which includes zoning or logging in. It ensures the effect is active
    -- if the item is equipped.
    local playerId = target:getID()
    local itemId = item:getID()
    local listenerId = "COMPOSERS_MITTS_" .. playerId

    if target:getEquipID(xi.slot.HANDS) == itemId and not target:hasListener(listenerId) then
        itemObject.onItemEquip(target, item, xi.slot.HANDS)
    end
    return 0
end

itemObject.onItemEquip = function(target, item, slot)
    if slot ~= nil and slot ~= xi.slot.HANDS then
        return
    elseif target:getEquipID(xi.slot.HANDS) ~= item:getID() then
        return
    end

    local playerId = target:getID()
    local listenerId = "COMPOSERS_MITTS_" .. playerId

    -- Only add the listeners if they don't exist to prevent duplicates
    if not target:hasListener(listenerId) then
        target:addListener("TICK", listenerId, function(p_tick)
            if p_tick:getEquipID(xi.slot.HANDS) ~= item:getID() then
                p_tick:removeListener(listenerId)
                removeEffect(p_tick)
                return
            end
            updateMadrigal(p_tick)
        end)

        -- Perform initial check in case Madrigal is already active
        updateMadrigal(target)
    end
end

itemObject.onItemUnequip = function(target, item, slot)
    if slot ~= nil and slot ~= xi.slot.HANDS then
        return
    end

    local playerId = target:getID()
    local listenerId = "COMPOSERS_MITTS_" .. playerId

    -- Remove the listeners
    target:removeListener(listenerId)

    removeEffect(target)
end

return itemObject