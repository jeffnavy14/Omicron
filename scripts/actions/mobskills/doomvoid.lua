---------------------------------------------
-- Doomvoid
--
-- Description: normally this teleports people, but with bart, it knocks off your weapon.
---------------------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local slots =
    {
        {1,     xi.slot.MAIN  },
        {2,     xi.slot.SUB   },
        {4,     xi.slot.RANGED},
        {8,     xi.slot.AMMO  },
        {16,    xi.slot.HEAD  },
        {32,    xi.slot.BODY  },
        {64,    xi.slot.HANDS },
        {128,   xi.slot.LEGS  },
        {256,   xi.slot.FEET  },
        {512,   xi.slot.NECK  },
        {1024,  xi.slot.WAIST },
        {2048,  xi.slot.EAR1  },
        {4096,  xi.slot.EAR2  },
        {8192,  xi.slot.RING1 },
        {16384, xi.slot.RING2 },
        {32768, xi.slot.BACK  },
    }

    local shuffle = math.random(1, 16)

    target:unequipItem(slots[shuffle][2])
    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.ENCUMBRANCE_II, slots[shuffle][1], 0, math.random(15,30)))

    return xi.effect.ENCUMBRANCE_II
end

return mobskillObject