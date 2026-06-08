-----------------------------------
-- Zesho Meppo
-- Katana weapon skill
-- Skill Level: 350
-- Delivers a fourfold attack. Damage varies with TP.
-- Modifier: DEX:25% AGI:25%
-- Skillchain Properties: Induration, Reverberation, Fusion
-- 100%TP    200%TP    300%TP
-- 4.0       8.0       18.715
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 4
    params.ftpMod = { 4.0, 8.0, 18.715 }
    params.dex_wsc = 0.25
    params.agi_wsc = 0.25
    params.multiHitfTP = true

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
