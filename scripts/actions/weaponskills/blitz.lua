-----------------------------------
-- Blitz
-- Axe weapon skill
-- Skill Level: 350
-- Delivers a fivefold attack. Damage varies with TP.
-- Modifier: STR:32% DEX:32%
-- Skillchain Properties: Liquefaction, Impaction, Fragmentation
-- 100%TP    200%TP    300%TP
-- 1.5       7.0       12.5
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 5
    params.ftpMod = { 1.5, 7.0, 12.5 }
    params.str_wsc = 0.32
    params.dex_wsc = 0.32
    params.multiHitfTP = true

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
