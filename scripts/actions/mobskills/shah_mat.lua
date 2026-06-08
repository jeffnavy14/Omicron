-----------------------------------
--  Shah Mat
--  Description: Gains temporary terror and 10 count doom gaze
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(xi.mobskills.mobGazeMove(mob, target, xi.effect.DOOM, 10, 3, 30))
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.TERROR, 1, 3, 10)

    return xi.effect.DOOM
end

return mobskillObject