-----------------------------------
-- func: fafnir
-- desc: Summon a fightable Fafnir (no loot) using modular enums
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 5,
    parameters = ''
}

commandObj.onTrigger = function(player)
    -- Safe direct namespace verification (bypasses loading or alias bugs)
    local mobData = ld and ld.mobs and ld.mobs.ABASHED_HEARTWING
    
    if not mobData then
        player:printToPlayer("Error: LD_MOBs metadata could not be resolved inside ld.mobs.")
        return
    end

    local zoneOrInstanceObj = player:getZone()

    local instance = player:getInstance()
    if instance then
        zoneOrInstanceObj = instance
    end

    if not zoneOrInstanceObj then
        return
    end

    local mob = zoneOrInstanceObj:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name    = 'LDmobs',

        x        = player:getXPos(),
        y        = player:getYPos(),
        z        = player:getZPos(),
        rotation = player:getRotPos(),

        groupId     = mobData.groupId,
        groupZoneId = mobData.groupZoneId,
        minLevel    = 90,
        maxLevel    = 90,

        onMobDeath = function(mobObj, playerArg, optParams)
        end,

        releaseIdOnDisappear  = true,
        specialSpawnAnimation = true,

        mixins =
        {
            require('scripts/mixins/rage'),
            require('scripts/mixins/job_special'),
        },
    })

    if not mob then
        player:printToPlayer("Error: Failed to allocate dynamic entity.")
        return
    end

    mob:setSpawn(player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos())
    mob:setDropID(0) 
    mob:setMobMod(xi.mobMod.NO_DROPS, 1)
    mob:spawn()

    player:printToPlayer(string.format('Spawning LDmobs (Lv: %i, HP: %i)', mob:getMainLvl(), mob:getMaxHP()))
end

return commandObj