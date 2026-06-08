-----------------------------------
-- Sarv
-- Archery weapon skill
-- Skill Level: 350
-- Damage varies with TP.
-- Modifier: STR:65% AGI:65%
-- Skillchain Properties: Transfixion, Scission, Gravitation
-- 100%TP    200%TP    300%TP
-- 2.75       5.5       8.25
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 2.75, 5.5, 8.25 }
    params.str_wsc = 0.65
    params.agi_wsc = 0.65

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
