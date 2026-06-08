-----------------------------------
-- !mydummy command
-----------------------------------
require('modules/module_utils')

local cmdprops =
{
    permission = 0,
    parameters = "s"
}

local statMap = {
    [1]  = { mod = xi.mod.DEF,  name = "DEF",   func = "getStat" },
    [2]  = { mod = xi.mod.VIT,  name = "VIT",   func = "getStat" },
    [3]  = { mod = xi.mod.EVA,  name = "EVA",   func = "getStat" },
    [4]  = { mod = xi.mod.MEVA, name = "MEVA",  func = "getMod"  },
    [5]  = { mod = xi.mod.MDEF, name = "MDEF",  func = "getStat" },
    [6]  = { mod = xi.mod.AGI,  name = "AGI",   func = "getStat" },
    [7]  = { mod = xi.mod.MND,  name = "MND",   func = "getStat" },
    [8]  = { mod = xi.mod.INT,  name = "INT",   func = "getStat" },
    [9]  = { mod = xi.mod.DEX,  name = "DEX",   func = "getStat" },
    [10] = { mod = xi.mod.CHR,  name = "CHR",   func = "getStat" },
    [11] = { mod = xi.mod.STR,  name = "STR",   func = "getStat" },
}

local presets = {
    ["UNM135"] = {
        level = 130,
        stats = {
            [1]  = 875, -- DEF
            [2]  = 113, -- VIT
            [3]  = 794, -- EVA
            [4]  = 573, -- MEVA
            [5]  = 250, -- MDEF
            [6]  = 137, -- AGI
            [7]  = 113, -- MND
            [8]  = 141, -- INT
            [9]  = 137, -- DEX
            [10] = 123, -- CHR
            [11] = 123, -- STR
        }
    }
}

local allowedZones = {
    [xi.zone.NORTH_GUSTABERG]   = true,
    [xi.zone.SOUTH_GUSTABERG]   = true,
    [xi.zone.WEST_SARUTABARUTA] = true,
    [xi.zone.EAST_SARUTABARUTA] = true,
    [xi.zone.WEST_RONFAURE]     = true,
    [xi.zone.EAST_RONFAURE]     = true,
}

local function onTrigger(player, argString)
    if not allowedZones[player:getZoneID()] then
        player:printToPlayer("You cannot use this command in this zone.", xi.msg.channel.SYSTEM_3)
        return
    end

    local RoEAactive = {16,17,18,19,20,21,22,23,29,696,697,698}
    for i = 1, #RoEAactive do
        if player:hasEminenceRecord(RoEAactive[i]) then
            player:printToPlayer('You have a RoE Deal Damage Quest active that needs to be disabled to use these test dummys', xi.msg.channel.SYSTEM_3)
            return
        end
    end

    if player:getLocalVar("DummyActive") == 1 then
        player:printToPlayer("You already have a dummy spawned.", xi.msg.channel.SYSTEM_3)
        return
    end

    local args = {}
    if argString then
        for w in argString:gmatch("%S+") do table.insert(args, w) end
    end

    local preset = presets[string.upper(args[1] or "")]
    local level = nil
    
    if preset then
        level = preset.level
    else
        level = tonumber(args[1])
    end

    if not level or level < 1 or level > 199 then
        player:printToPlayer("Usage: !mydummy <level> [stat_id value]... OR !mydummy <preset>", xi.msg.channel.SYSTEM_3)
        player:printToPlayer("Stat IDs: 1=DEF, 2=VIT, 3=EVA, 4=MEVA, 5=MDEF", xi.msg.channel.SYSTEM_3)
        player:printToPlayer("Stat IDs: 6=AGI, 7=MND, 8=INT, 9=DEX, 10=CHR, 11=STR", xi.msg.channel.SYSTEM_3)
        player:printToPlayer("Available Presets: UNM135", xi.msg.channel.SYSTEM_3)
        return
    end

    local zone = player:getZone()
    
    -- Calculate spawn position (2 yalms in front)
    local dist = 2
    local pX = player:getXPos()
    local pY = player:getYPos()
    local pZ = player:getZPos()
    local pRot = player:getRotPos()
    
    -- Convert rotation to radians (0-255 -> 0-2pi)
    local rads = pRot * (math.pi / 128)
    local spawnX = pX + (dist * math.cos(rads))
    local spawnZ = pZ - (dist * math.sin(rads))
    
    local dummy = zone:insertDynamicEntity({
        objtype = xi.objType.MOB,
        name = "Striking Dummy",
        look = 431, 
        x = spawnX,
        y = pY,
        z = spawnZ,
        rotation = (pRot + 128) % 256, -- Face the player
        groupId = 44,
        groupZoneId = 146,
        releaseIdOnDisappear = true,
        
        onMobSpawn = function(mob)
            mob:setMobLevel(level)
            mob:setLocalVar("CreatorID", player:getID())
            
            -- Apply stats
            if preset then
                for statId, statVal in pairs(preset.stats) do
                    local entry = statMap[statId]
                    local current = 0
                    if entry.func == "getStat" then
                        current = mob:getStat(entry.mod)
                    else
                        current = mob:getMod(entry.mod)
                    end
                    local diff = statVal - current
                    mob:addMod(entry.mod, diff)
                end
            else
                for i = 2, #args, 2 do
                    local statId = tonumber(args[i])
                    local statVal = tonumber(args[i+1])
                    
                    if statId and statVal and statMap[statId] then
                        if statVal > 1999 then
                            statVal = 1999
                        end
                        local entry = statMap[statId]
                        local current = 0
                        
                        if entry.func == "getStat" then
                            current = mob:getStat(entry.mod)
                        else
                            current = mob:getMod(entry.mod)
                        end
                        
                        local diff = statVal - current
                        mob:addMod(entry.mod, diff)
                    end
                end
            end
            
            -- Dummy properties
            mob:addStatusEffect(xi.effect.STUN, { power = 1, origin = mob, duration = 0 })
            mob:setMobMod(xi.mobMod.CHARMABLE, 0)
            mob:setMobMod(xi.mobMod.NO_MOVE, 1)
            mob:setMobMod(xi.mobMod.NO_AGGRO, 1)
            mob:setMobMod(xi.mobMod.NO_LINK, 1)
            mob:setUnkillable(true)
            mob:setMobMod(xi.mobMod.SPELL_LIST, 0)
            mob:setMobMod(xi.mobMod.SKILL_LIST, 0)
            mob:setMagicCastingEnabled(false)
            mob:setAutoAttackEnabled(false)
            mob:addStatusEffect (xi.effect.REGEN, { power = 5000, duration = 0, origin = mob, tick = 3 })
            mob:addMod(xi.mod.HPP, 5000)
            mob:updateHealth()
            mob:setHP(mob:getMaxHP())

            mob:timer(30000, function(m)
                if m and m:isSpawned() and m:getTarget() == nil then
                    DespawnMob(m:getID())
                end
            end)
        end,
        
        onMobEngage = function(mob, target)
            mob:addListener("COMBAT_TICK", "DUMMY_DISENGAGED", function(m)
                if not target:isEngaged() then
                    m:disengage()
                    m:resetEnmity(target)
                    m:timer(3000, function(m2)
                           DespawnMob(m2:getID())
                        end)
                    
                end
            end)
        end,
        
        onMobDeath = function(mob, player, optParams)
            DespawnMob(mob:getID())
        end,

        onMobDespawn = function(mob)
            local creatorID = mob:getLocalVar("CreatorID")
            local creator = GetPlayerByID(creatorID)
            if creator then
                creator:setLocalVar("DummyActive", 0)
            end
        end
    })
    
    if dummy then
        dummy:setSpawn(spawnX, pY, spawnZ, (pRot + 128) % 256)
        dummy:spawn()
        player:setLocalVar("DummyActive", 1)
        if preset then
            player:printToPlayer(string.format("Spawned Level %d Striking Dummy with preset '%s'.", level, string.upper(args[1])), xi.msg.channel.SYSTEM_3)
        else
            player:printToPlayer(string.format("Spawned Level %d Striking Dummy.", level), xi.msg.channel.SYSTEM_3)
        end
    else
        player:printToPlayer("Failed to spawn dummy.", xi.msg.channel.SYSTEM_3)
    end
end

return {
    onTrigger = onTrigger,
    cmdprops = cmdprops
}