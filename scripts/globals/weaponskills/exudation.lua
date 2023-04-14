-----------------------------------
-- Exudation
-- Club weapon skill
-- Skill Level: N/A
-- Attack varies with TP. Idris: Aftermath effect varies with TP.
-- Will stack with Sneak Attack.
-- Element: None
-- Skillchain Elements: Darkness / Fragmentation (Ice, Earth, Water, Dark gorget/belt aligned)
-- Modifiers: 50% INT / 50% MND
-- 1000 TP   2000 TP   3000 TP
-- 1.50      3.625     4.75
-----------------------------------
require("scripts/globals/aftermath")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/weaponskills")
-----------------------------------
local weaponskillObject = {}

-- source https://www.bg-wiki.com/ffxi/Exudation, https://wiki.ffo.jp/html/31449.html
weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftp100 = 1.50 params.ftp200 = 3.625 params.ftp300 = 4.75
    params.str_wsc = 0.0 params.dex_wsc = 0.0 params.vit_wsc = 0.0 params.agi_wsc = 0.0 params.int_wsc = 0.5 params.mnd_wsc = 0.5 params.chr_wsc = 0.0
    params.crit100 = 0.0 params.crit200 = 0.0 params.crit300 = 0.0
    params.canCrit = false
    params.acc100 = 0.0 params.acc200 = 0.0 params.acc300 = 0.0
    params.atk100 = 0.0 params.atk200 = 0.0 params.atk300 = 0.0
    params.ignoresDef = false
    params.ignored100 = 0
    params.ignored200 = 0
    params.ignored300 = 0

    -- Apply aftermath
    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.MYTHIC)

    local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
