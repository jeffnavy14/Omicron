-----------------------------------
-- Imperator
-- Sword weapon skill
-- Skill Level: 350
-- Delivers a single hit attack. Damage varies with TP.
-- Modifier: DEX:70% MND:70%
-- Skillchain Properties: Detonation, Compression, Distortion
-- 100%TP    200%TP    300%TP
-- 3.75      7.5       11.75
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 3.75, 7.5, 11.75 }
    params.dex_wsc = 0.7
    params.mnd_wsc = 0.7
    params.multiHitfTP = true

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
