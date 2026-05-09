-----------------------------------
-- Equipment On Counter effects
-- Called from battleentity.cpp after a PC successfully counters.
-----------------------------------
xi = xi or {}
xi.combat = xi.combat or {}

xi.combat.onCounter = function(player, attacker)
    if not player:isPC() then
        return
    end

    -- Premium Heart: each counter reduces next Chakra recast by 1s (consumed in chakra.lua onAbilityCheck)
    if player:getEquipID(xi.slot.MAIN) == xi.item.PREMIUM_HEART then
        player:setLocalVar('PREMIUM_HEART_CHAKRA_BONUS', player:getLocalVar('PREMIUM_HEART_CHAKRA_BONUS') + 1)
    end
end
