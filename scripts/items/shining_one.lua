-----------------------------------
-- Item: Shining One
-- Adds Critical Hit Rate during Weaponskills based on TP consumed.
-----------------------------------

local itemObject = {}

local function applyEffect(target, tp)
    local bonus = 0

    if tp >= 3000 then
        bonus = 15
    elseif tp >= 2000 then
        bonus = 10
    elseif tp >= 1000 then
        bonus = 5
    end

    if bonus > 0 then
        target:addMod(xi.mod.CRITHITRATE_ONLY_WEP, bonus)
        target:setLocalVar("TP_Crit_Bonus", bonus)
    end
end

local function removeEffect(target)
    local currentBonus = target:getLocalVar("TP_Crit_Bonus")
    if currentBonus > 0 then
        target:delMod(xi.mod.CRITHITRATE_ONLY_WEP, currentBonus)
        target:setLocalVar("TP_Crit_Bonus", 0)
    end
end

itemObject.onItemCheck = function(target, item, param, caster)
    -- This function is called when the item is checked by the server,
    -- which includes zoning or logging in. It ensures the effect is active
    -- if the item is equipped.
    local playerId = target:getID()
    local itemId = item:getID()
    local listenerId = "SHINING_ONE_" .. playerId

    if target:getEquipID(xi.slot.MAIN) == itemId and not target:hasListener(listenerId) then
        itemObject.onItemEquip(target, item, xi.slot.MAIN)
    end
    return 0
end

itemObject.onItemEquip = function(target, item, slot)
    if slot ~= nil and slot ~= xi.slot.MAIN then
        return
    elseif target:getEquipID(xi.slot.MAIN) ~= item:getID() then
        return
    end

    local playerId = target:getID()
    local listenerId = "SHINING_ONE_" .. playerId

    -- Only add the listeners if they don't exist to prevent duplicates
    if not target:hasListener(listenerId) then
        -- WEAPONSKILL_USE listener fires before damage calculation (state 1) and after it finishes (state 2).
        target:addListener("WEAPONSKILL_USE", listenerId, function(player, mobTarget, state)
            if player:getEquipID(xi.slot.MAIN) ~= item:getID() then
                player:removeListener(listenerId)
                removeEffect(player)
                return
            end
            
            if state == 1 then
                -- Player is readying the WS, apply the modifier based on current TP
                applyEffect(player, player:getTP())
            elseif state == 2 then
                -- WS is finished, strip the modifier so normal attacks aren't affected
                removeEffect(player)
            end
        end)
    end
end

itemObject.onItemUnequip = function(target, item, slot)
    if slot ~= nil and slot ~= xi.slot.MAIN then
        return
    end

    local playerId = target:getID()
    local listenerId = "SHINING_ONE_" .. playerId

    -- Remove the listener
    target:removeListener(listenerId)

    removeEffect(target)
end

return itemObject