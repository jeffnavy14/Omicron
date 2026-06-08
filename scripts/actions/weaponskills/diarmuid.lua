-----------------------------------
-- Diarmuid
-- Polearm weapon skill
-- Skill Level: 350
-- Delivers a twofold attack. Damage varies with TP.
-- Modifier: STR:55% VIT:55%
-- Skillchain Properties: Transfixion, Scission, Gravitation
-- 100%TP    200%TP    300%TP
-- 2.17      5.36      8.55
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 2
    params.ftpMod = { 2.17, 5.36, 8.55 }
    params.str_wsc = 0.55
    params.vit_wsc = 0.55
    params.multiHitfTP = true

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
