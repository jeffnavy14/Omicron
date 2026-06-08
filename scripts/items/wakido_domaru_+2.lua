-----------------------------------
-- Wakido Domaru +2
-- Adds an 8-10% chance to gain 80-100 TP when taking damage
-----------------------------------

local itemObject = {}

local function applyTpBonus(target)
    local procChance = math.random(8, 10)
    if math.random(1, 100) <= procChance then
        local tpGain = math.random(80, 100)
        target:addTP(tpGain)
        target:printToPlayer(string.format("Wakido Domaru +2 grants %d TP!", tpGain))
    end
end

itemObject.onItemCheck = function(target, item, param, caster)
    local itemId = item:getID()

    if target:getEquipID(xi.slot.BODY) == itemId then
        itemObject.onItemEquip(target, item, xi.slot.BODY)
    end
    return 0
end

itemObject.onItemEquip = function(target, item, slot)
    if slot ~= nil and slot ~= xi.slot.BODY then
        return
    elseif target:getEquipID(xi.slot.BODY) ~= item:getID() then
        return
    end

    local playerId = target:getID()
    local listenerDamage = "WAKIDO_DOMARU_DMG_" .. playerId

    if not target:hasListener(listenerDamage) then
        target:addListener("TAKE_DAMAGE", listenerDamage, function(targ, amount, attacker, attackType, damageType)
            if targ:getEquipID(xi.slot.BODY) ~= item:getID() then
                itemObject.onItemUnequip(targ, item, xi.slot.BODY)
                return
            end

            if amount and amount > 0 then
                applyTpBonus(targ)
            end
        end)
    end
end

itemObject.onItemUnequip = function(target, item, slot)
    if slot ~= nil and slot ~= xi.slot.BODY then
        return
    end

    local playerId = target:getID()
    target:removeListener("WAKIDO_DOMARU_DMG_" .. playerId)
end

return itemObject