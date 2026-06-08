-----------------------------------
-- Item: Ask_sash
-- Adds Regain +200 while under the effect of Boost
-----------------------------------

local itemObject = {}

-- Change this to the slot the item equips to (e.g., xi.slot.BODY, xi.slot.WAIST)
local ITEM_SLOT = xi.slot.WAIST

local function applyEffect(target)
    if target:getLocalVar("BoostRegainEffect") == 0 then
        target:addMod(xi.mod.REGAIN, 200)
        target:setLocalVar("BoostRegainEffect", 1)
    end
end

local function removeEffect(target)
    if target:getLocalVar("BoostRegainEffect") > 0 then
        target:delMod(xi.mod.REGAIN, 200)
        target:setLocalVar("BoostRegainEffect", 0)
    end
end

local function updateBoost(target)
    if target:hasStatusEffect(xi.effect.BOOST) then
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
    local listenerId = "BOOST_REGAIN_" .. playerId

    if target:getEquipID(ITEM_SLOT) == itemId and not target:hasListener(listenerId) then
        itemObject.onItemEquip(target, item, ITEM_SLOT)
    end
    return 0
end

itemObject.onItemEquip = function(target, item, slot)
    if slot ~= nil and slot ~= ITEM_SLOT then
        return
    elseif target:getEquipID(ITEM_SLOT) ~= item:getID() then
        return
    end

    local playerId = target:getID()
    local listenerId = "BOOST_REGAIN_" .. playerId

    -- Only add the listener if it doesn't exist to prevent duplicates
    if not target:hasListener(listenerId) then
        target:addListener("TICK", listenerId, function(p_tick)
            if p_tick:getEquipID(ITEM_SLOT) ~= item:getID() then
                p_tick:removeListener(listenerId)
                removeEffect(p_tick)
                return
            end
            updateBoost(p_tick)
        end)

        -- Perform initial check in case Boost is already active
        updateBoost(target)
    end
end

itemObject.onItemUnequip = function(target, item, slot)
    if slot ~= nil and slot ~= ITEM_SLOT then
        return
    end

    local playerId = target:getID()
    local listenerId = "BOOST_REGAIN_" .. playerId

    -- Remove the listener
    target:removeListener(listenerId)

    removeEffect(target)
end

return itemObject