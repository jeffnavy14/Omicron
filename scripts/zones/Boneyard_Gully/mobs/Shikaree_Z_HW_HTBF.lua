-----------------------------------
-- Area: Boneyard_Gully
--  Mob: Shikaree Z (Head Wind)
-- BCNM: Head Wind
-----------------------------------
local ID = zones[xi.zone.BONEYARD_GULLY]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addImmunity(xi.immunity.SILENCE)
    mob:addImmunity(xi.immunity.PETRIFY)
    mob:addImmunity(xi.immunity.LIGHT_SLEEP)
    mob:addImmunity(xi.immunity.DARK_SLEEP)
    --50% fast cast, no standback
    mob:setMod(xi.mod.UFASTCAST, 50)
    mob:setMobMod(xi.mobMod.NO_STANDBACK, 1)
end

entity.onMobSpawn = function(mob)
    mob:setMod(xi.mod.DARK_SLEEP_RES_RANK, 8)
    mob:setMod(xi.mod.LIGHT_SLEEP_RES_RANK, 8)
    mob:setMod(xi.mod.BIND_RES_RANK, 8)
    mob:setMod(xi.mod.REGAIN, 55)
    mob:setMod(xi.mobMod.MAGIC_DELAY, 35)
    mob:addMobMod(xi.mobMod.BASE_DAMAGE_MULTIPLIER, 150)
    mob:setMobAbilityEnabled(false)

    mob:addMod(xi.mod.STR, 100)
    mob:addMod(xi.mod.VIT, 100)
    mob:addMod(xi.mod.INT, 100)
    mob:addMod(xi.mod.MND, 100)
    mob:addMod(xi.mod.CHR, 100)
    mob:addMod(xi.mod.AGI, 100)
    mob:addMod(xi.mod.DEX, 100)
    mob:addMod(xi.mod.DEF, 100)
    mob:addMod(xi.mod.RATT, 250)
    mob:addMod(xi.mod.ACC, 375)
    mob:addMod(xi.mod.ATT, 275)
    mob:addMod(xi.mod.MATT, 250)
    mob:addMod(xi.mod.MACC, 250)
    mob:addMod(xi.mod.MEVA, 200)
    mob:addMod(xi.mod.MDEF, 200)
    mob:setMod(xi.mod.EVA, 100)

    -- Resistances
    mob:setMod(xi.mod.EARTH_SDT, 100)
    mob:setMod(xi.mod.DARK_SDT, 100)
    mob:setMod(xi.mod.LIGHT_SDT, 100)
    mob:setMod(xi.mod.ICE_SDT, 100)
    mob:setMod(xi.mod.FIRE_SDT, 100)
    mob:setMod(xi.mod.WATER_SDT, 100)
    mob:setMod(xi.mod.THUNDER_SDT, 100)
    mob:setMod(xi.mod.WIND_SDT, 100)
    mob:setMod(xi.mod.SILENCERES, 100)
    mob:setMod(xi.mod.STUNRES, 50)
    mob:setMod(xi.mod.BINDRES, 50)
    mob:setMod(xi.mod.GRAVITYRES, 50)
    mob:setMod(xi.mod.SLEEPRES, 50)
    mob:setMod(xi.mod.POISONRES, 50)
    mob:setMod(xi.mod.PARALYZERES, 50)
    mob:setMod(xi.mod.LULLABYRES, 0)
    mob:setMod(xi.mod.FASTCAST, 50)

    -- Regen/Regain
    mob:addStatusEffect(xi.effect.REGEN,  { power = 25, duration = 0, origin = mob, tick = 3 })
    mob:addStatusEffect(xi.effect.REGAIN,  { power = 10, duration = 0, origin = mob, tick = 3 })

    mob:addListener('WEAPONSKILL_USE', 'SHIKAREE_Z_WS', function(mobArg, targetArg, skillid, spentTP, action)
        if skillid == xi.mobSkill.JUMP_1 then
            action:setCategory(xi.action.category.WEAPONSKILL_FINISH)
        end
    end)
end

entity.onMobEngage = function(mob, target)
    xi.mob.callPets(mob, mob:getID() + 3)
    mob:setLocalVar('jumpTimer', GetSystemTime() + 30)
    mob:messageText(mob, ID.text.SHIKAREE_ENGAGE)
end

entity.onMobFight = function(mob, target)
    -- Handle "Blackened Siredon" timer and effect.
    local siredonTimer = mob:getLocalVar('siredonTimer')
    if siredonTimer > 0 and GetSystemTime() >= siredonTimer then
        mob:setLocalVar('siredonTimer', 0)
        mob:setMod(xi.mod.REGAIN, 55)
    end

    if xi.combat.behavior.isEntityBusy(mob) then
        return
    end

    local battlefield = mob:getBattlefield()
    if not battlefield then
        return
    end

    -- Lock target during skillchain execution (scState 2=STARTING, 3=EXECUTING)
    local scState = battlefield:getLocalVar('scState')
    if scState == 2 or scState == 3 then
        local scLeaderID = battlefield:getLocalVar('scLeader')
        local scLeader = scLeaderID > 0 and GetMobByID(scLeaderID) or nil
        if scLeader and scLeader:isAlive() then
            local leaderTarget = scLeader:getTarget()
            if leaderTarget and leaderTarget:getID() ~= target:getID() then
                mob:updateEnmity(leaderTarget)
            end
        end

        -- Shikaree use TP at 1000 when solo
    elseif scState == 4 and mob:getTP() >= 1000 then
        mob:useMobAbility()
    end

    -- Handle jump timer
    local jumpTimer = mob:getLocalVar('jumpTimer')
    if GetSystemTime() >= jumpTimer then
        mob:useMobAbility(xi.mobSkill.JUMP_1)
        mob:setLocalVar('jumpTimer', GetSystemTime() + 90)
    end
end

entity.onMobMobskillChoose = function(mob, target, skillId)
    local tpMoves =
    {
        xi.mobSkill.IMPULSE_DRIVE,
        xi.mobSkill.PENTA_THRUST,
        xi.mobSkill.SKEWER,
        xi.mobSkill.WHEELING_THRUST,
    }

    return tpMoves[math.random(1, #tpMoves)]
end

entity.onMobWeaponSkill = function(target, mob, skill)
    local skillID     = skill:getID()
    local battlefield = mob:getBattlefield()

    if not battlefield then
        return
    end

    -- Solo skill message when only one Shikaree is alive (scState 4 = SOLO)
    if battlefield:getLocalVar('scState') == 4 then
        mob:messageText(mob, ID.text.SHIKAREE_Z_OFFSET + 4)
        return
    end

    -- Handle skillchain progression
    local scSkill  = mob:getLocalVar('scSkill')
    local scNextID = mob:getLocalVar('scNextID')

    if skillID == scSkill then
        -- Transition from STARTING to EXECUTING when leader's skill fires
        if battlefield:getLocalVar('scState') == 2 then
            battlefield:setLocalVar('scState', 3)
        end

        -- Pull message for either starting SC or using skill mid SC
        local scMessage = mob:getLocalVar('scMessage')
        if scMessage > 0 then
            mob:messageText(mob, scMessage)
        end

        -- Clear this mob's skill tracking
        mob:setLocalVar('scSkill', 0)
        mob:setLocalVar('scPendingTime', 0)

        -- Trigger next mob in chain
        if scNextID > 0 then
            local nextMob = GetMobByID(scNextID)
            if nextMob and nextMob:isAlive() then
                nextMob:setLocalVar('scPendingTime', GetSystemTime() + 3)
            end
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
    mob:messageText(mob, ID.text.SHIKAREE_Z_OFFSET)
end

entity.onMobDespawn = function(mob)
    mob:removeListener('SHIKAREE_Z_WS')
end

return entity
