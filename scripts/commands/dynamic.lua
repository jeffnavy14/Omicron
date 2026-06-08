-----------------------------------
-- func: dynamic
-- desc: Summon a dynamic mob via !dynamic <groupID> <groupZoneId> <level> [name] [hp]
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 3,
    parameters = 'iiiss' 
}

commandObj.onTrigger = function(player, groupId, groupZoneId, level, arg4, arg5)
    -- Validate that the 3 required arguments were provided
    if not groupId or not groupZoneId or not level then
        player:printToPlayer('Usage: !dynamic <groupID> <groupZoneId> <level> [name] [hp]')
        return
    end

    local customName = nil
    local customHP = nil

    -- Smart sorting for our optional arguments
    if arg5 and arg5 ~= '' then
        customName = arg4
        customHP = tonumber(arg5)
    elseif arg4 and arg4 ~= '' then
        if tonumber(arg4) then
            customHP = tonumber(arg4)
        else
            customName = arg4
        end
    end

    ---@type CZone|CInstance?
    local zoneOrInstanceObj = player:getZone()

    local instance = player:getInstance()
    if instance then
        zoneOrInstanceObj = instance
    end

    if not zoneOrInstanceObj then
        return
    end

    -- Build the base dynamic entity parameters
    local mobParams = {
        objtype = xi.objType.MOB,
        
        x = player:getXPos(),
        y = player:getYPos(),
        z = player:getZPos(),
        rotation = player:getRotPos(),

        groupId = groupId,
        groupZoneId = groupZoneId,
        minLevel = level,
        maxLevel = level,

        releaseIdOnDisappear = true,
        specialSpawnAnimation = true,
    }

    -- Apply the custom name if provided
    if customName and customName ~= '' then
        local formattedName = string.gsub(customName, "_", " ")
        mobParams.name = formattedName
        mobParams.packetName = formattedName
    else
        mobParams.name = 'DynamicMob'
    end

    local mob = zoneOrInstanceObj:insertDynamicEntity(mobParams)

    if not mob then
        player:printToPlayer('Failed to spawn mob. Please verify the <groupID> and <groupZoneId> are valid in the database.')
        return
    end

    mob:setSpawn(player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos())
    mob:setDropID(0) -- No loot
    mob:setMobMod(xi.mobMod.NO_DROPS, 1)

    -- Spawn the mob FIRST
    mob:spawn()

    -- Apply the HP override logic directly from your snippet
    if customHP then
        local hp  = mob:getMaxHP()
        local hpp = math.ceil((customHP / hp) * 100) - 100
        
        mob:addMod(xi.mod.HPP, hpp)
        mob:updateHealth()
        mob:setHP(mob:getMaxHP())
    end

    player:printToPlayer(string.format('Spawning Dynamic Mob (Lv: %i, HP: %i)\n%s', mob:getMainLvl(), mob:getMaxHP(), mob))
end

return commandObj