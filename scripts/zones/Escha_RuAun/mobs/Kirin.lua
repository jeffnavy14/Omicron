-----------------------------------
-- Area: Escha RuAun
--  Mob: Kirin
-----------------------------------
local ID = zones[xi.zone.ESCHA_RUAUN]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMobMod(xi.mobMod.ALWAYS_AGGRO, 1)
    mob:hideName(false)
	mob:setUntargetable(false)
    mob:setAutoAttackEnabled(true)
end

entity.onMobFight = function(mob, target)
    -- captures show cure v repeatedly every 15 sec below 50% health
    if mob:getHPP() <= 50 then
        local pos = mob:getPos()
        local kouryu = GetMobByID(ID.mob.KOURYU)

        if kouryu and not kouryu:isSpawned() then
            local killTimer = mob:getLocalVar('Kill_Timer')
            local killNotification = mob:getLocalVar('Kill_Notification')
            local qmId = target:getLocalVar('GEASFEAT_QM')
            local npc = GetNPCByID(qmId)

            SpawnMob(kouryu:getID()):updateClaim(target)
            kouryu:setPos(pos.x, pos.y, pos.z, pos.rot)
            kouryu:addStatusEffect(xi.effect.CONFRONTATION, { power = 2, origin = kouryu })

            kouryu:setLocalVar('Kill_Timer', killTimer)
            kouryu:setLocalVar('Kill_Notification', killNotification)
            kouryu:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)

            xi.geasFete.setCountDown(target, kouryu)

            kouryu:addListener('COMBAT_TICK', 'MOB_TIMER_' .. kouryu:getID(), function(mobArg)
                xi.geasFete.getTimeOfBattle(mobArg)
                if mobArg:getLocalVar('Kill_Timer') < os.time() then
                    DespawnMob(mobArg:getID())
                end
            end)

            kouryu:addListener('DEATH', 'COUNTDOWN_TIMER' .. kouryu:getID(), function(mobArg)
                if npc then
                    npc:setLocalVar('MobCount', npc:getLocalVar('MobCount') - 1)
                    if npc:getLocalVar('MobCount') <= 0 then
                        npc:setLocalVar('MobCount', 0)
                        npc:setStatus(xi.status.NORMAL)

                        local alliance = target:getAlliance()
                        if alliance then
                            for _, member in pairs(alliance) do
                                member:countdown()
                                member:delStatusEffect(xi.effect.CONFRONTATION)
                            end
                        else
                            target:countdown()
                            target:delStatusEffect(xi.effect.CONFRONTATION)
                        end
                    end
                end
            end)

            kouryu:addListener('DESPAWN', 'QM_' .. qmId, function(mobArg)
                if mobArg:getHP() > 0 and npc then
                    npc:setLocalVar('MobCount', npc:getLocalVar('MobCount') - 1)
                    if npc:getLocalVar('MobCount') <= 0 then
                        npc:setLocalVar('MobCount', 0)
                        npc:setStatus(xi.status.NORMAL)
                    end
                end
            end)

            mob:setLocalVar("Transforming", 1)
            DespawnMob(mob:getID())
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)

end

entity.onMobDespawn = function(mob)

end

return entity
