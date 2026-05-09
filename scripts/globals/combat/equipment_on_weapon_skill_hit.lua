-----------------------------------
-- Equipment On Weapon Skill Hit effects
-- Called from charentity.cpp after a primary weapon skill hit against a mob.
-----------------------------------
xi = xi or {}
xi.combat = xi.combat or {}

xi.combat.onWeaponSkillHit = function(player, target, wsID)
    if not player:isPC() then
        return
    end

    -- Artemis's Bow +2: each weapon skill reduces next Barrage recast by 1s (consumed in checkBarrage)
    if player:getEquipID(xi.slot.RANGED) == xi.item.ARTEMISS_BOW_P2 then
        player:setLocalVar('ARTEMISS_BOW_P2_BARRAGE_BONUS', player:getLocalVar('ARTEMISS_BOW_P2_BARRAGE_BONUS') + 1)
    end
end
