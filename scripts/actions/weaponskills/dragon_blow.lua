-----------------------------------
-- Dragon Blow
-- Hand-to-Hand weapon skill
-- Skill Level: 350
-- Delivers a two-hit attack. Damage varies with TP.
-- Modifier: DEX:85%
-- Skillchain Properties: Distortion
-- 100%TP    200%TP    300%TP
-- 3.0       5.5       8.0
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 2
    params.ftpMod = { 3.675, 7.0, 10.4375 }
    params.dex_wsc = 0.8
    params.multiHitfTP = true

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
