-----------------------------------
-- Terminus
-- Marksmanship weapon skill
-- Skill Level: 350
-- Damage varies with TP.
-- Modifier: DEX:70% AGI:70%
-- Skillchain Properties: Induration, Reverberation, Fusion
-- 100%TP    200%TP    300%TP
--  2.5         5        7.5
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 2.5, 5.0, 7.5 }
    params.dex_wsc = 0.7
    params.agi_wsc = 0.7

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
