-----------------------------------
-- Dagda
-- Club weapon skill
-- Skill Level: 350
-- Delivers a twofold attack. Damage varies with TP.
-- Modifier: STR:40% MND:40%
-- Skillchain Properties: Transfixion, Scission, Gravitation
-- 100%TP    200%TP    300%TP
-- 4.5       8.5       12.5
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 2
    params.ftpMod = { 3.0, 7.25, 9.75 } --No information on this, used Randgrith's wsc values, and black halo's ftp.
    params.str_wsc = 0.7
    params.mnd_wsc = 0.7
    params.multiHitfTP = true

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
