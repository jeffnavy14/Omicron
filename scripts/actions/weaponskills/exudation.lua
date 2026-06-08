-----------------------------------
-- Exudation
-- Club weapon skill
-- Delivers a single-hit attack. Damage varies with TP.
-- Element: None
-- Modifiers: INT:50%  MND:50%
-- 100%TP    200%TP    300%TP
--   .5       2.6       3.75
-----------------------------------
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 2.8 }
    params.int_wsc = 0.5 params.mnd_wsc = 0.5

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftpMod = { 3.5, 8.75, 12.0 }
        params.int_wsc = 0.5 params.mnd_wsc = 0.5
    end

        -- Apply Aftermath
    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.MYTHIC)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
