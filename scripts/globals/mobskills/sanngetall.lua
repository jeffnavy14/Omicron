-----------------------------------
--  Sanngetall
--
--  Description: 15y dispel
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 15y
-----------------------------------
require("scripts/globals/mobskills")
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local dispel =  target:dispelAllStatusEffect(bit.bor(xi.effectFlag.DISPELABLE))
	
	if dispel == 0 then
        -- no effect
        skill:setMsg(xi.msg.basic.SKILL_NO_EFFECT) -- no effect
    else
        skill:setMsg(xi.msg.basic.DISAPPEAR_NUM)
    end

    return dispel
end

return mobskillObject
