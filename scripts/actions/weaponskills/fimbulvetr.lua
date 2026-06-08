-----------------------------------
-- Fimbulvetr
-- Great Sword weapon skill
-- Skill Level: 350
-- Damage varies with TP.
-- Modifier: STR:60% VIT:60%
-- Skillchain Properties: Detonation, Compression, Distortion
-- 100%TP    200%TP    300%TP
-- 3.3       6.6       9.9
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 3.3, 6.6, 9.9 }
    params.str_wsc = 0.6
    params.vit_wsc = 0.6
    params.multiHitfTP = true

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
