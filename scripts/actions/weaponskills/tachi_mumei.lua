-----------------------------------
-- Tachi: Mumei
-- Great Katana weapon skill
-- Skill Level: 350
-- Damage varies with TP.
-- Modifier: STR:50% DEX:50%
-- Skillchain Properties: Detonation, Compression, Distortion
-- 100%TP    200%TP    300%TP
--  3.66      7.33      11
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 3.66, 7.33, 11.0 }
    params.str_wsc = 0.5
    params.dex_wsc = 0.5
    params.multiHitfTP = true

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
