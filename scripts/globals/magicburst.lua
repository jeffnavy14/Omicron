xi = xi or {}
xi.magicburst = xi.magicburst or {}

---@param target CBaseEntity
---@param actionElement number
---@return number, number
xi.magicburst.formMagicBurst = function(target, actionElement)
    if not target then
        return 0, 0
    end

    if not actionElement then
        return 0, 0
    end

    if actionElement <= xi.element.NONE or actionElement > xi.element.DARK then
        return 0, 0
    end

    local resonance = target:getStatusEffect(xi.effect.SKILLCHAIN)
    if not resonance then
        return 0, 0
    end

    local resonanceTier = resonance:getTier()
    if resonanceTier <= 0 then
        return 0, 0
    end

    local isMatch = xi.data.element.skillchainElementTable[actionElement][resonance:getPower()] > 0 and true or false
    if not isMatch then
        return 0, 0
    end

    return resonanceTier, resonance:getSubPower()
end

-- Returns a boolean if the element matches the skillchain property given
xi.magicburst.doesElementMatchWeaponskill = function(actionElement, SCProp)
    if SCProp == 0 then
        return false
    end

    return xi.data.element.skillchainElementTable[actionElement][SCProp] > 0 and true or false
end
