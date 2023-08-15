-----------------------------------
--  Ofnir
--
--  Description: Will K.O. any targets in range when Odin's attack is a certain ratio over their defense.
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Unknown *assuming 10y
-----------------------------------
require("scripts/globals/mobskills")
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    
	if
        target:isUndead() or
        target:hasStatusEffect(xi.effect.MAGIC_SHIELD) or
        -- Todo: DeathRes has no place in the resistance functions so far..
        math.random(1, 100) <= target:getMod(xi.mod.DEATHRES)
    then
        skill:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
        return 0
    end
	
    target:setHP(0)
end

return mobskillObject
