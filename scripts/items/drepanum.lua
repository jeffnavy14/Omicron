-----------------------------------
-- Drepanum Scythe
-- Latent: Adds skillchain damage bonus on a linear scale based on current MP.
-- 0% MP = +50% skillchain damage, 100% MP = +0% skillchain damage.
-----------------------------------

local itemObject = {}

-- xi.mod.SKILLCHAINBONUS scale matches existing gear convention: 1 = 1%.
-- (battleutils.cpp currently divides by 10000, which appears to be a bug vs.
-- the comment and gear values; scaling with other items keeps Drepanum balanced
-- and lets it auto-correct when the formula is fixed upstream.)
local MAX_BONUS = 50

-- Retail behavior for jobs with 0 max MP (e.g. WAR/SAM, BST/WAR) is undocumented.
-- Default: no bonus. Flip to true if testing confirms these jobs receive the full +50%.
local APPLY_BONUS_TO_NO_MP_JOBS = false

local function removeEffect(target)
    local bonus = target:getLocalVar("DrepanumSCBonus")
    if bonus > 0 then
        target:delMod(xi.mod.SKILLCHAINBONUS, bonus)
    end
    target:setLocalVar("DrepanumSCBonus", 0)
end

local function updateBonus(target)
    local oldBonus = target:getLocalVar("DrepanumSCBonus")

    local maxMP = target:getMaxMP()
    local newBonus = 0

    if maxMP > 0 then
        local mpPercent = target:getMP() / maxMP
        -- Linear scale: full bonus at 0% MP, none at 100% MP
        newBonus = math.floor((1 - mpPercent) * MAX_BONUS)
        newBonus = math.max(0, math.min(newBonus, MAX_BONUS))
    elseif APPLY_BONUS_TO_NO_MP_JOBS then
        newBonus = MAX_BONUS
    end

    if newBonus == oldBonus then
        return
    end

    if oldBonus > 0 then
        target:delMod(xi.mod.SKILLCHAINBONUS, oldBonus)
    end

    if newBonus > 0 then
        target:addMod(xi.mod.SKILLCHAINBONUS, newBonus)
    end

    target:setLocalVar("DrepanumSCBonus", newBonus)
end

itemObject.onItemCheck = function(target, item, param, caster)
    local playerId = target:getID()
    local itemId = item:getID()
    local listenerId = "DREPANUM_SC_" .. playerId

    if target:getEquipID(xi.slot.MAIN) == itemId and not target:hasListener(listenerId) then
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
    local listenerId = "DREPANUM_SC_" .. playerId

    if not target:hasListener(listenerId) then
        target:addListener("TICK", listenerId, function(p_tick)
            -- If main-hand isn't Drepanum right now, skip this tick.
            -- Real unequip cleanup happens in onItemUnequip.
            if p_tick:getEquipID(xi.slot.MAIN) ~= itemId then
                return
            end
            updateBonus(p_tick)
        end)

        updateBonus(target)
    end
end

itemObject.onItemUnequip = function(target, item, slot)
    local playerId = target:getID()
    local listenerId = "DREPANUM_SC_" .. playerId

    target:removeListener(listenerId)
    removeEffect(target)
end

return itemObject