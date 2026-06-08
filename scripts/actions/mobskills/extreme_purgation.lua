---------------------------------------------
-- Extreme Purgation
-- Family: Sandworm
-- Description: Transfers all positive and negative status effects to mob
-- Type: Enfeebling
-- Utsusemi/Blink absorb: 2-3 shadows
-- Notes:
---------------------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local removables = {}
	local counter = 1

	-- Status Effect ID from status_effect.h
	for i = 1, 629 do
		if (i ~= 1 and i ~= 2 and i ~= 14 and i ~= 17 and i ~= 18 and i ~= 127 and i ~= 143 and i ~= 177 and
		   not (i >= 233 and i <= 264) and not (i >= 266 and i <= 273) and i ~= 276 and not (i >= 284 and i <= 285) and i ~= 287 and
		    i ~= 292 and i ~= 434 and not (i >= 474 and i <= 476) and not (i >= 510 and i <= 512) and
			i ~= 575 and i ~= 578 and i ~= 579 and i ~= 585 and not (i >= 613 and i <= 614) and i ~= 616 and i ~= 618 and i ~= 627) then
			removables[counter] = i
			counter = counter + 1
		end
	end

	local statusEffect

	for i, effect in ipairs(removables) do
		if (target:hasStatusEffect(effect)) then
			statusEffect = target:getStatusEffect(effect)

			mob:addStatusEffect(effect, {
				power = statusEffect:getPower(),
				tick = statusEffect:getTickCount(),
				duration = statusEffect:getDuration() / 1000,
				subPower = statusEffect:getSubPower(),
				tier = statusEffect:getTier(),
				origin = mob
			})
			target:delStatusEffect(effect)
		end
	end

    skill:setMsg(xi.msg.basic.NONE)

    return 0
end

return mobskillObject
