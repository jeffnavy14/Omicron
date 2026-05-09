-----------------------------------
-- Equipment On Skillchain effects
-- Called from charentity.cpp after any successful skillchain.
-----------------------------------
xi = xi or {}
xi.combat = xi.combat or {}

xi.combat.onSkillchain = function(player, target, effect)
    if not player:isPC() then
        return
    end

    local mainWeapon = player:getEquipID(xi.slot.MAIN)

    -- Drastic Axe: each skillchain extends Berserk duration by 1s
    if mainWeapon == xi.item.DRASTIC_AXE then
        local berserk = player:getStatusEffect(xi.effect.BERSERK)
        if berserk then
            berserk:setDuration(berserk:getDuration() + 1000)
        end
    end

    -- Zanmato +2: each skillchain reduces next Sekkanoki recast by 1s (consumed in sekkanoki.lua check)
    if mainWeapon == xi.item.ZANMATO_P2 then
        player:setLocalVar('ZANMATO_P2_SEKKANOKI_BONUS', player:getLocalVar('ZANMATO_P2_SEKKANOKI_BONUS') + 1)
    end

    -- Mutsu-no-Kami Yoshiyuki: each skillchain grants a Third Eye evasion when Seigan is active
    if mainWeapon == xi.item.MUTSU_NO_KAMI_YOSHIYUKI then
        if player:hasStatusEffect(xi.effect.SEIGAN) then
            player:delStatusEffect(xi.effect.THIRD_EYE)
            player:addStatusEffect(xi.effect.THIRD_EYE, { power = 1, duration = 30, origin = player })
        end
    end

    -- Malefic Axe: each skillchain reduces next Ready recast by 1s (consumed in ready.lua check)
    if mainWeapon == xi.item.MALEFIC_AXE then
        player:setLocalVar('MALEFIC_AXE_READY_BONUS', player:getLocalVar('MALEFIC_AXE_READY_BONUS') + 1)
    end
end
