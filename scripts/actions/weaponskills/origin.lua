-----------------------------------
-- Origin
-- Scythe weapon skill
-- Skill Level: 350
-- Absorbs HP and MP. Damage varies with TP.
-- Modifier: STR:60% INT:60%
-- Skillchain Properties: Induration, Reverberation, Fusion
-- 100%TP    200%TP    300%TP
-- 3.0       6.0       9.0
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 3.0, 6.0, 9.0 }
    params.str_wsc = 0.6
    params.int_wsc = 0.6
    params.multiHitfTP = true

    local targetHP = target:getHP()
    local targetMP = target:getMP()

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    -- Handle HP/MP Drain
    if not target:isUndead() then
        local drain = math.floor(damage * math.random(30, 70) / 100)
        local aspir = math.floor(damage * math.random(30, 70) / 100) -- Copied Catastrophe code for this, applied to HP/MP

        drain = utils.clamp(drain, 0, targetHP)
        aspir = utils.clamp(aspir, 0, targetMP) -- Created separate calcs for drain/mp so that it wouldn't always be the same amount between the two
        -- if proper testing is found, can easily adjust this.
        player:addHP(drain)
        player:addMP(aspir)
    end

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
