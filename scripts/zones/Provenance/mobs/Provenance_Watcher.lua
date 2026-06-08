-----------------------------------
-- Area: Provenance
--   NM: Provenance Watcher
local ID = zones[xi.zone.PROVENANCE]
mixins = { require('scripts/mixins/rage') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)

end

entity.onMobSpawn = function(mob)
 local crystalFetter = GetMobByID(ID.mob.CRYSTAL_FETTER)
   worldbossGiveImmunity(mob) -- set immunity based on day
   worldbossReflect(mob) -- % chance to reflect spell
   worldbossBuildResistance(mob) -- builds resistance to sleep,silence,paralyze, stun
   mob:hideHP(true)
   mob:setMobMod(xi.mobMod.SKILL_LIST, 49997)
   mob:setSpellList(523)
   mob:setLocalVar('cometMeteorTrigger', 60)
   mob:setLocalVar('CFTrigger', 90)
   mob:setMobMod(xi.mobMod.NO_MOVE, 1)
   if crystalFetter and crystalFetter:isAlive() then
      DespawnMob(ID.mob.CRYSTAL_FETTER)
   end
   
end

entity.onMobRoam = function(mob)
end

entity.onMobEngage = function(mob,target)
    mob:setLocalVar('[rage]timer', 3600) -- 60 minutes
end

entity.onMobDisengage = function(mob)
    mob:setLocalVar('PhaseChange', 0)
    mob:setLocalVar('cometMeteorUse', 0)
    mob:setLocalVar('cometMeteorTrigger', 0)
    mob:setLocalVar('CFSummon', 0)
    mob:setLocalVar('CFTrigger', 0)
    mob:setAnimationSub(1)
    mob:setHP(mob:getMaxHP())
end

entity.onMobFight = function(mob, target)
    local mobHPP = mob:getHPP()
    local act = mob:getCurrentAction()
    local isBusy = false
    local cmUse = mob:getLocalVar('cometMeteorUse')
    local cmTrigger   = mob:getLocalVar('cometMeteorTrigger')
    local changePhase = mob:getLocalVar('PhaseChange')
    local crystalFetter = mob:getLocalVar('CFSummon')
    local cfTrigger     = mob:getLocalVar('CFTrigger')

    if
       act == xi.action.MOBABILITY_START or
       act == xi.action.MOBABILITY_USING or
       act == xi.action.MOBABILITY_FINISH or
       act == xi.action.MAGIC_START or
       act == xi.action.MAGIC_CASTING or
       act == xi.action.MAGIC_START
    then
       isBusy = true -- is set to true if PW is in any stage of using a mobskill or casting a spell
    end

    -- set animatin sub to 2 to bring out 4 wings and change to skill set 2
    if mob:getHPP() <= 50 and
        changePhase == 0 or nil then
        mob:setAnimationSub(2)
        mob:setLocalVar('PhaseChange', 1)
        mob:setMobMod(xi.mobMod.SKILL_LIST, 49998)
    end

    -- casts meteor or comet every -15% HPS starting at 60%
    if mob:actionQueueEmpty() and not isBusy then
        if cmUse < 5 then
            if mobHPP <= cmTrigger and
                mobHPP >= cmTrigger - 5 then
                mob:castSpell(math.random(218,219))
                mob:setLocalVar('cometMeteorTrigger', cmTrigger - 15)
                mob:setLocalVar('cometMeteorUse', cmUse +1)
            end
        end
    end

    -- summons a crystal fetter every - 10% HPs starting at 90%
    if crystalFetter < 10 then
        if mobHPP <= cfTrigger and
           mobHPP >= cfTrigger - 5 then
           SpawnMob(ID.mob.CRYSTAL_FETTER):updateEnmity(target)
           mob:setLocalVar('CFTrigger', cfTrigger - 10)
           mob:setLocalVar('CFSummon', crystalFetter +1)
            mob:addStatusEffect(xi.effect.PHYSICAL_SHIELD, { power = 1, origin = mob, icon = 0 })
            mob:addStatusEffect(xi.effect.ARROW_SHIELD, { power = 1, origin = mob, icon = 0 })
            mob:addStatusEffect(xi.effect.MAGIC_SHIELD, { power = 1, origin = mob, icon = 0 })

        end
    end
end

entity.onSpellPrecast = function(mob, spell)
   if spell:getID() == 218 or spell:getID() == 219 then
      spell:setAoE(xi.magic.aoe.RADIAL)
      --spell:setFlag(xi.magic.spellFlag.HIT_ALL) -- no longer exists
      spell:setRadius(15)
   end
end

entity.onMagicHit = function(caster, target, spell)
end

entity.onMobWeaponSkill = function(target, mob, skill)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
