-----------------------------------
-- Level 2 Holy (ID: 2453)
-- Dice Roll: 2
-- Description: Deals Light damage to targets in an area of effect.
-- Mechanic: Hits if target Max HP is divisible by 2.
-- Notes: If Divine Favor is active, damage is lethal.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill, action)
    local divisor = 2
    local targets = {}

    if target:isPC() then
        targets = target:getParty() or { target }
    elseif target:isPet() or target:isTrust() then
        local master = target:getMaster()
        if master and master:isPC() then
            targets = master:getParty() or { master }
        else
            targets = { target }
        end
    else
        targets = { target }
    end

    local divineFavor = false
    if mob:getLocalVar("DivineFavor") == 1 then
        divineFavor = true
        mob:setLocalVar("DivineFavor", 0)
    end

    local primaryDamage = 0
    local primaryMessage = xi.msg.basic.SKILL_NO_EFFECT

    for _, member in ipairs(targets) do
        if member:getZoneID() == mob:getZoneID() and member:checkDistance(mob) <= 20 and not member:isDead() then
            local maxHP = member:getMaxHP()

            if maxHP % divisor == 0 then
                local dmg = math.random(600, 1200)
                if divineFavor then dmg = 30000 end

                local params = {
                    baseDamage = dmg,
                    element = xi.element.LIGHT,
                    attackType = xi.attackType.MAGICAL,
                    damageType = xi.damageType.LIGHT,
                    shadowBehavior = xi.mobskills.shadowBehavior.WIPE_SHADOWS,
                }
                local info = xi.mobskills.mobMagicalMove(mob, member, skill, nil, params)

                if member:getID() == target:getID() then
                    primaryDamage = info.damage
                    primaryMessage = skill:getMsg()
                elseif xi.mobskills.processDamage(mob, member, skill, nil, info) then
                    member:takeDamage(info.damage, mob, info.attackType, info.damageType)
                end
            end
        end
    end

    skill:setMsg(primaryMessage)

    return primaryDamage
end

return mobskillObject