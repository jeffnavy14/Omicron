-----------------------------------
-- Maru Kala
-- Hand-to-Hand weapon skill
-- Skill Level: 350
-- Delivers a two-hit attack. Damage varies with TP.
-- Modifier: STR:41.75%, DEX:41.75%
-- Skillchain Properties: Detonation, Compression, Distortion
-- 100%TP    200%TP    300%TP
-- 3.128     7.273      11.414
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 2
    params.ftpMod = { 3.128, 7.273, 11.414 }
    params.str_wsc = 0.4175
    params.dex_wsc = 0.4175
    params.multiHitfTP = true

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
