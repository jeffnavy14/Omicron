-----------------------------------
xi = xi or {}
xi.combat = xi.combat or {}
xi.combat.damage = xi.combat.damage or {}
-----------------------------------

xi.combat.damage.physicalElementSDT = function(target, physicalElement)
    if
        physicalElement < xi.damageType.PIERCING or
        physicalElement > xi.damageType.HTH
    then
        return 1
    end

    local physicalElementSDTModifier =
    {
        [xi.damageType.PIERCING] = xi.mod.PIERCE_SDT,
        [xi.damageType.SLASHING] = xi.mod.SLASH_SDT,
        [xi.damageType.BLUNT   ] = xi.mod.IMPACT_SDT,
        [xi.damageType.HTH     ] = xi.mod.HTH_SDT,
    }

    local sdt = 1 + target:getMod(physicalElementSDTModifier[physicalElement]) / 10000

    return utils.clamp(sdt, 0, 3)
end

xi.combat.damage.magicalElementSDT = function(target, magicalElement)
    if
        magicalElement < xi.element.FIRE or
        magicalElement > xi.element.DARK
    then
        return 1
    end

    local sdt = 1 + target:getMod(xi.data.element.getElementalSDTModifier(magicalElement)) / 10000

    return utils.clamp(sdt, 0, 3)
end

xi.combat.damage.scarletDeliriumMultiplier = function(actor)
    -- Scarlet delirium are 2 different status effects. SCARLET_DELIRIUM_1 is the one that boosts power.
    if not actor:hasStatusEffect(xi.effect.SCARLET_DELIRIUM_1) then
        return 1
    end

    local scarletDeliriumMultiplier = 1 + actor:getStatusEffect(xi.effect.SCARLET_DELIRIUM_1):getPower() / 1000

    return scarletDeliriumMultiplier
end
