-----------------------------------
<<<<<<< HEAD
--
-- Assault 51 Nyzul Isle Investigation
--
-----------------------------------
local ID = require("scripts/zones/Nyzul_Isle/IDs")
require("scripts/globals/instance")
=======
-- Assault 51 : Nyzul Isle Investigation
-----------------------------------
local ID = require("scripts/zones/Nyzul_Isle/IDs")
require("scripts/globals/instance")
require("scripts/globals/items")
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("scripts/globals/nyzul")
require("scripts/globals/utils")
require("scripts/zones/Nyzul_Isle/globals/points")
-----------------------------------
<<<<<<< HEAD
local instance_object = {}
=======
local instanceObject = {}
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c

local function pickSetPoint(instance)
    local chars        = instance:getChars()
    local currentFloor = instance:getLocalVar("Nyzul_Current_Floor")

    -- Random the floor layout
    instance:setLocalVar("Nyzul_Isle_FloorLayout", math.random(1, (#xi.nyzul.FloorLayout - 1)))
    instance:setLocalVar("gearObjective", 0)

    -- Condition for floors
<<<<<<< HEAD
    if currentFloor % 20 == 0 then -- hard set objective and floor to boss stage for every 20th floor
        instance:setStage(xi.nyzul.objective.ELIMINATE_ENEMY_LEADER)
        instance:setLocalVar("Nyzul_Isle_FloorLayout", 0)
=======
    -- hard set objective and floor to boss stage for every 20th floor
    if currentFloor % 20 == 0 then
        instance:setStage(xi.nyzul.objective.ELIMINATE_ENEMY_LEADER)
        instance:setLocalVar("Nyzul_Isle_FloorLayout", 0)
    -- 3.33% for a free floor
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
    elseif math.random(1, 30) == 1 and instance:getLocalVar("freeFloor") == 0 then -- 3.33% for a free floor
        instance:setStage(xi.nyzul.objective.FREE_FLOOR)
        instance:setLocalVar("freeFloor", 1)

        GetNPCByID(ID.npc.RUNE_TRANSFER_START, instance):timer(9000,
        function(m)
            local currentInstance = m:getInstance()
            currentInstance:setProgress(15)
        end) -- Completes objective for free floor
    else
<<<<<<< HEAD
        instance:setStage(math.random(xi.nyzul.objective.ELIMINATE_ENEMY_LEADER, xi.nyzul.objective.ELIMINATE_ALL_ENEMIES)) -- Randoms floor objective
=======
        -- Build the valid objectives list
        local objective = {}

        for i = xi.nyzul.objective.ELIMINATE_ENEMY_LEADER, xi.nyzul.objective.ELIMINATE_ALL_ENEMIES do
            table.insert(objective, i)
        end

        -- Only remove objectives if not the staging room or free floor
        if instance:getStage() ~= 0 and instance:getStage() ~= 6 then
            table.remove(objective, instance:getStage())
        end

        -- Randomly pick the objective from the generated list
        instance:setStage(utils.pickRandom(objective))
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c

        if math.random(1, 30) <= 5 then
            instance:setLocalVar("gearObjective", math.random(xi.nyzul.gearObjective.AVOID_AGRO, xi.nyzul.gearObjective.DO_NOT_DESTROY))
        end
    end

    -- Setup points to travel to
    local layoutPoint = xi.nyzul.FloorLayout[instance:getLocalVar("Nyzul_Isle_FloorLayout")]
    local posX        = layoutPoint[1] local posY = layoutPoint[2] local posZ = layoutPoint[3]

    -- Set Rune of Transfer to Point
    for _, npcID in pairs(ID.npc.RUNE_OF_TRANSFER) do
        local runeOfTransfer = GetNPCByID(npcID, instance)

        if runeOfTransfer:getStatus() == xi.status.DISAPPEAR then
            runeOfTransfer:setAnimationSub(0)
            runeOfTransfer:setPos(posX, posY, posZ)
            runeOfTransfer:setStatus(xi.status.NORMAL)

            break
        end
    end

    -- Set players to Point and messaging
    for _, players in pairs(chars) do
        players:setPos(posX, posY, posZ)
        players:messageName(ID.text.WELCOME_TO_FLOOR, players, currentFloor, currentFloor)

        if instance:getStage() ~= xi.nyzul.objective.FREE_FLOOR then
<<<<<<< HEAD
            players:messageName(ID.text.ELIMINATE_ENEMY_LEADER + instance:getStage(), players)
=======
            players:messageName(ID.text.OBJECTIVE_TEXT_OFFSET + instance:getStage(), players)
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
            local gearObjective = instance:getLocalVar("gearObjective")

            if gearObjective > 0 then
                players:messageSpecial(ID.text.ELIMINATE_ALL_ENEMIES + gearObjective)
            end
        end
    end

    -- Set Rune of Transfer Menu
    instance:setLocalVar("menuChoice", math.random(1, 20))
end

local function lampsActivate(instance)
    local floorLayout    = instance:getLocalVar("Nyzul_Isle_FloorLayout")
    local lampsObjective = instance:getLocalVar("[Lamps]Objective")
    local runicLamp_1    = GetNPCByID(ID.npc.RUNIC_LAMP_1, instance)
<<<<<<< HEAD
    local partySize      = instance:getLocalVar("partySize")

    if partySize > 4 then
        partySize = 5
    elseif partySize < 3 then
        partySize = 3
    end

    local lampPoints = {}
=======
    local partySize      = utils.clamp(instance:getLocalVar("partySize"), 3, 5)
    local lampPoints     = {}
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c

    for i = 1, #xi.nyzulPoint.LampPoint[floorLayout] do
        table.insert(lampPoints, i, xi.nyzulPoint.LampPoint[floorLayout][i])
    end

    -- Lamp Objective: Register
    if lampsObjective == xi.nyzul.lampsObjective.REGISTER then
        local spawnPoint = math.random(1, #lampPoints)

        instance:setLocalVar("[Lamp]PartySize", instance:getLocalVar("partySize"))
        runicLamp_1:setPos(lampPoints[spawnPoint])
        runicLamp_1:setStatus(xi.status.NORMAL)
    -- Lamp Objective: Activate All
    elseif lampsObjective == xi.nyzul.lampsObjective.ACTIVATE_ALL then
        local runicLamps = math.random(2, partySize - 1)
        instance:setLocalVar("[Lamp]count", runicLamps)

        for i = ID.npc.RUNIC_LAMP_1, ID.npc.RUNIC_LAMP_1 + runicLamps do
            local spawnPoint = math.random(1, #lampPoints)

            GetNPCByID(i, instance):setPos(lampPoints[spawnPoint])
            GetNPCByID(i, instance):setStatus(xi.status.NORMAL)
            table.remove(lampPoints, spawnPoint)
        end
    -- Lamp Objective: Activate in Order
    elseif lampsObjective == xi.nyzul.lampsObjective.ORDER then
        local runicLamps = math.random(2, 4)
        local lampOrder  = {}

        for j = 1, runicLamps + 1 do
            table.insert(lampOrder, j)
        end

        instance:setLocalVar("[Lamp]count", runicLamps)
        instance:setLocalVar("[Lamp]lampRegister", 0)

        for i = ID.npc.RUNIC_LAMP_1, ID.npc.RUNIC_LAMP_1 + runicLamps do
            local spawnPoint = math.random(1, #lampPoints)
            local lampRandom = math.random(1, #lampOrder)

            GetNPCByID(i, instance):setPos(lampPoints[spawnPoint])
            GetNPCByID(i, instance):setStatus(xi.status.NORMAL)
            GetNPCByID(i, instance):setLocalVar("[Lamp]order", lampOrder[lampRandom])

            table.remove(lampOrder, lampRandom)
            table.remove(lampPoints, spawnPoint)
        end
    end
end

local function pickMobs(instance)
    local currentFloor = instance:getLocalVar("Nyzul_Current_Floor")
    local mobFamily    = math.random(1, 16)
    local floorLayout  = instance:getLocalVar("Nyzul_Isle_FloorLayout")
    local pointTable   = xi.nyzulPoint.SpawnPoint[floorLayout]
    local spawnPoint   = {}

    -- 20th floor bosses
    if currentFloor % 20 == 0 then
        local floorBoss = 0

        if currentFloor == 20 or currentFloor == 40 then
            floorBoss = math.random(xi.nyzul.pickMobs[0][40].ADAMANTOISE, xi.nyzul.pickMobs[0][40].FAFNIR)
        elseif currentFloor == 60 or currentFloor == 80 or currentFloor == 100 then
            floorBoss = math.random(xi.nyzul.pickMobs[0][100].KHIMAIRA, xi.nyzul.pickMobs[0][100].CERBERUS)
        end

        GetMobByID(ID.mob[51].ARCHAIC_RAMPART1, instance):setSpawn(-36, 0, -362, 0)
        GetMobByID(floorBoss, instance):setSpawn(-55.000, 1, -380.000, 250)
        SpawnMob(ID.mob[51].ARCHAIC_RAMPART1, instance)
        SpawnMob(floorBoss, instance)

    -- All other floors
    else
        for i = 1, #pointTable do
            table.insert(spawnPoint, i, pointTable[i])
        end

        -- Not "free floors"
        if instance:getStage() ~= xi.nyzul.objective.FREE_FLOOR then
<<<<<<< HEAD
            -- Enemy Leader Objective
            if instance:getStage() == xi.nyzul.objective.ELIMINATE_ENEMY_LEADER then
                local floorBoss = math.random(xi.nyzul.pickMobs[1].MOKKE, xi.nyzul.pickMobs[1].LONG_HORNED_CHARIOT)

                if floorBoss == 17092962 then
                    floorBoss = 17092961 + (math.random(0, 1) * 2)
                end

                local sPoint = math.random(1, #spawnPoint)
                local SPX    = spawnPoint[sPoint][1]
                local SPY    = spawnPoint[sPoint][2]
                local SPZ    = spawnPoint[sPoint][3]
                local SPRot  = spawnPoint[sPoint][4]

                GetMobByID(floorBoss, instance):setSpawn(SPX, SPY, SPZ, SPRot)
                SpawnMob(floorBoss, instance)
                table.remove(spawnPoint, sPoint)

            -- Specified Enemy Group Objective
            elseif instance:getStage() == xi.nyzul.objective.ELIMINATE_SPECIFIED_ENEMIES then
                local specificEnemies    = {}
                local specificGroup      = math.random(0, 6)
                local groupAmount        = math.random(2, #xi.nyzul.pickMobs[2][specificGroup])
                local specificEnemyGroup = xi.nyzul.pickMobs[2][specificGroup]

                for i = 1, #specificEnemyGroup do
                    table.insert(specificEnemies, specificEnemyGroup[i])
                end

                while groupAmount > 0 do
                    local randomEnemy = math.random(1, #specificEnemies)
                    local enemy       = specificEnemies[randomEnemy]
                    local sPoint      = math.random(1, #spawnPoint)
                    local SPX         = spawnPoint[sPoint][1]
                    local SPY         = spawnPoint[sPoint][2]
                    local SPZ         = spawnPoint[sPoint][3]
                    local SPRot       = spawnPoint[sPoint][4]

                    GetMobByID(enemy, instance):setSpawn(SPX, SPY, SPZ, SPRot)
                    SpawnMob(enemy, instance)
                    table.remove(spawnPoint, sPoint)
                    table.remove(specificEnemies, randomEnemy)
                    instance:setLocalVar("Eliminate", instance:getLocalVar("Eliminate") + 1)

                    groupAmount = groupAmount - 1
                end

            -- Eliminate All Objective
            elseif instance:getStage() == xi.nyzul.objective.ELIMINATE_ALL_ENEMIES then
                if math.random(0, 100) >= 80 then -- 20% chance that Dahank will spawn
                    local sPoint = math.random(1, #spawnPoint)
                    local SPX    = spawnPoint[sPoint][1]
                    local SPY    = spawnPoint[sPoint][2]
                    local SPZ    = spawnPoint[sPoint][3]
                    local SPRot  = spawnPoint[sPoint][4]

                    GetMobByID(ID.mob[51].DAHAK, instance):setSpawn(SPX, SPY, SPZ, SPRot)
                    SpawnMob(ID.mob[51].DAHAK, instance)
                    table.remove(spawnPoint, sPoint)
                    instance:setLocalVar("Eliminate", instance:getLocalVar("Eliminate") + 1)
                end

            -- Activate Lamps Objective
            elseif instance:getStage() == xi.nyzul.objective.ACTIVATE_ALL_LAMPS then
                instance:setLocalVar("[Lamps]Objective", math.random(xi.nyzul.lampsObjective.REGISTER, xi.nyzul.lampsObjective.ORDER))
                lampsActivate(instance)
            end

            -- 1st Rampart: 90% spawn rate
            if math.random(0, 100) >= 90 then
                local sPoint = math.random(1, #spawnPoint)
                local SPX    = spawnPoint[sPoint][1]
                local SPY    = spawnPoint[sPoint][2]
                local SPZ    = spawnPoint[sPoint][3]
                local SPRot  = spawnPoint[sPoint][4]

                GetMobByID(ID.mob[51].ARCHAIC_RAMPART1, instance):setSpawn(SPX, SPY, SPZ, SPRot)
=======
            switch (instance:getStage()) : caseof
            {
                -- Enemy Leader Objective
                [xi.nyzul.objective.ELIMINATE_ENEMY_LEADER] = function()
                    local floorBoss = math.random(xi.nyzul.pickMobs[1].MOKKE, xi.nyzul.pickMobs[1].LONG_HORNED_CHARIOT)

                    if floorBoss == 17092962 then
                        floorBoss = 17092961 + (math.random(0, 1) * 2)
                    end

                    local sPoint    = math.random(1, #spawnPoint)
                    local sPointX   = spawnPoint[sPoint][1]
                    local sPointY   = spawnPoint[sPoint][2]
                    local sPointZ   = spawnPoint[sPoint][3]
                    local sPointRot = spawnPoint[sPoint][4]

                    GetMobByID(floorBoss, instance):setSpawn(sPointX, sPointY, sPointZ, sPointRot)
                    SpawnMob(floorBoss, instance)
                    table.remove(spawnPoint, sPoint)
                end,

                -- Specified Enemy Group Objective
                [xi.nyzul.objective.ELIMINATE_SPECIFIED_ENEMIES] = function()
                    local specificEnemies    = {}
                    local specificGroup      = math.random(0, 6)
                    local groupAmount        = math.random(2, #xi.nyzul.pickMobs[2][specificGroup])
                    local specificEnemyGroup = xi.nyzul.pickMobs[2][specificGroup]

                    for i = 1, #specificEnemyGroup do
                        table.insert(specificEnemies, specificEnemyGroup[i])
                    end

                    while groupAmount > 0 do
                        local randomEnemy = math.random(1, #specificEnemies)
                        local enemy       = specificEnemies[randomEnemy]
                        local sPoint      = math.random(1, #spawnPoint)
                        local sPointX     = spawnPoint[sPoint][1]
                        local sPointY     = spawnPoint[sPoint][2]
                        local sPointZ     = spawnPoint[sPoint][3]
                        local sPointRot   = spawnPoint[sPoint][4]

                        GetMobByID(enemy, instance):setSpawn(sPointX, sPointY, sPointZ, sPointRot)
                        SpawnMob(enemy, instance)
                        table.remove(spawnPoint, sPoint)
                        table.remove(specificEnemies, randomEnemy)
                        instance:setLocalVar("Eliminate", instance:getLocalVar("Eliminate") + 1)

                        groupAmount = groupAmount - 1
                    end
                end,

                -- Eliminate All Objective
                [xi.nyzul.objective.ELIMINATE_ALL_ENEMIES] = function()
                    if math.random(0, 100) >= 80 then -- 20% chance that Dahank will spawn
                        local sPoint    = math.random(1, #spawnPoint)
                        local sPointX   = spawnPoint[sPoint][1]
                        local sPointY   = spawnPoint[sPoint][2]
                        local sPointZ   = spawnPoint[sPoint][3]
                        local sPointRot = spawnPoint[sPoint][4]

                        GetMobByID(ID.mob[51].DAHAK, instance):setSpawn(sPointX, sPointY, sPointZ, sPointRot)
                        SpawnMob(ID.mob[51].DAHAK, instance)
                        table.remove(spawnPoint, sPoint)
                        instance:setLocalVar("Eliminate", instance:getLocalVar("Eliminate") + 1)
                    end
                end,

            -- Activate Lamps Objective
                [xi.nyzul.objective.ACTIVATE_ALL_LAMPS] = function()
                    instance:setLocalVar("[Lamps]Objective", math.random(xi.nyzul.lampsObjective.REGISTER, xi.nyzul.lampsObjective.ORDER))
                    lampsActivate(instance)
                end,
            }

            -- 1st Rampart: 90% spawn rate
            if math.random(0, 100) >= 90 then
                local sPoint    = math.random(1, #spawnPoint)
                local sPointX   = spawnPoint[sPoint][1]
                local sPointY   = spawnPoint[sPoint][2]
                local sPointZ   = spawnPoint[sPoint][3]
                local sPointRot = spawnPoint[sPoint][4]

                GetMobByID(ID.mob[51].ARCHAIC_RAMPART1, instance):setSpawn(sPointX, sPointY, sPointZ, sPointRot)
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c

                SpawnMob(ID.mob[51].ARCHAIC_RAMPART1, instance)
                table.remove(spawnPoint, sPoint)

                if instance:getStage() == xi.nyzul.objective.ELIMINATE_ALL_ENEMIES then
                    instance:setLocalVar("Eliminate", instance:getLocalVar("Eliminate") + 1)
                end
            end

            -- 2nd Rampart: 20% spawn rate
            if math.random(0, 100) >= 20 then
<<<<<<< HEAD
                local sPoint = math.random(1, #spawnPoint)
                local SPX    = spawnPoint[sPoint][1]
                local SPY    = spawnPoint[sPoint][2]
                local SPZ    = spawnPoint[sPoint][3]
                local SPRot  = spawnPoint[sPoint][4]

                GetMobByID(ID.mob[51].ARCHAIC_RAMPART2, instance):setSpawn(SPX, SPY, SPZ, SPRot)
=======
                local sPoint    = math.random(1, #spawnPoint)
                local sPointX   = spawnPoint[sPoint][1]
                local sPointY   = spawnPoint[sPoint][2]
                local sPointZ   = spawnPoint[sPoint][3]
                local sPointRot = spawnPoint[sPoint][4]

                GetMobByID(ID.mob[51].ARCHAIC_RAMPART2, instance):setSpawn(sPointX, sPointY, sPointZ, sPointRot)
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
                SpawnMob(ID.mob[51].ARCHAIC_RAMPART2, instance)
                table.remove(spawnPoint, sPoint)

                if instance:getStage() == xi.nyzul.objective.ELIMINATE_ALL_ENEMIES then
                    instance:setLocalVar("Eliminate", instance:getLocalVar("Eliminate") + 1)
                end
            end

            -- Spawn Gears
            if instance:getLocalVar("gearObjective") > 0 then
<<<<<<< HEAD
                for i = xi.nyzul.FloorEntities[17].start, xi.nyzul.FloorEntities[17].stop do
                    local sPoint = math.random(1, #spawnPoint)
                    local SPX    = spawnPoint[sPoint][1]
                    local SPY    = spawnPoint[sPoint][2]
                    local SPZ    = spawnPoint[sPoint][3]
                    local SPRot  = spawnPoint[sPoint][4]

                    instance:setLocalVar("gearPenalty", math.random(xi.nyzul.penalty.TIME, xi.nyzul.penalty.PATHOS))
                    GetMobByID(i, instance):setSpawn(SPX, SPY, SPZ, SPRot)
=======
                for i = xi.nyzul.floorEntities[17].start, xi.nyzul.floorEntities[17].stop do
                    local sPoint    = math.random(1, #spawnPoint)
                    local sPointX   = spawnPoint[sPoint][1]
                    local sPointY   = spawnPoint[sPoint][2]
                    local sPointZ   = spawnPoint[sPoint][3]
                    local sPointRot = spawnPoint[sPoint][4]

                    instance:setLocalVar("gearPenalty", math.random(xi.nyzul.penalty.TIME, xi.nyzul.penalty.PATHOS))
                    GetMobByID(i, instance):setSpawn(sPointX, sPointY, sPointZ, sPointRot)
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
                    SpawnMob(i, instance)
                    table.remove(spawnPoint, sPoint)
                end
            end

            -- Trash NM's of floor
            local spawnedNMs = math.random(0, 4)

            if spawnedNMs > 0 then
                local floorSection = math.floor(currentFloor / 20) + 1
<<<<<<< HEAD

                while spawnedNMs > 2 do
                    local sPoint   = math.random(1, #spawnPoint)
                    local randomNM = 0
                    local NM_mob   = 0
                    local SPX      = spawnPoint[sPoint][1]
                    local SPY      = spawnPoint[sPoint][2]
                    local SPZ      = spawnPoint[sPoint][3]
                    local SPRot    = spawnPoint[sPoint][4]

                    if currentFloor % 2 == 0 then
                        randomNM = math.random(1, #xi.nyzul.evenFloorNMs[floorSection])
                        NM_mob   = xi.nyzul.evenFloorNMs[floorSection][randomNM]
                        table.remove(xi.nyzul.evenFloorNMs[floorSection], randomNM)
                    else
                        randomNM = math.random(1, #xi.nyzul.oddFloorNMs[floorSection])
                        NM_mob   = xi.nyzul.oddFloorNMs[floorSection][randomNM]
                        table.remove(xi.nyzul.oddFloorNMs[floorSection], randomNM)
                    end

                    GetMobByID(NM_mob, instance):setSpawn(SPX, SPY, SPZ, SPRot)
                    SpawnMob(NM_mob, instance)

=======
                local mobGroup = 0
                local floorNMs = {}

                if currentFloor % 2 == 0 then
                    mobGroup = xi.nyzul.randomNMs.evenFloor[floorSection]
                else
                    mobGroup = xi.nyzul.randomNMs.oddFloor[floorSection]
                end

                for i = 1, #mobGroup do
                    table.insert(floorNMs, mobGroup[i])
                end

                while spawnedNMs > 2 do
                    local sPoint    = math.random(1, #spawnPoint)
                    local sPointX   = spawnPoint[sPoint][1]
                    local sPointY   = spawnPoint[sPoint][2]
                    local sPointZ   = spawnPoint[sPoint][3]
                    local sPointRot = spawnPoint[sPoint][4]
                    local index = math.random(1, #floorNMs)

                    GetMobByID(floorNMs[index], instance):setSpawn(sPointX, sPointY, sPointZ, sPointRot)
                    SpawnMob(floorNMs[index], instance)

                    table.remove(floorNMs, index)
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
                    table.remove(spawnPoint, sPoint)

                    spawnedNMs = spawnedNMs - 1

                    if instance:getStage() == xi.nyzul.objective.ELIMINATE_ALL_ENEMIES then
                        instance:setLocalVar("Eliminate", instance:getLocalVar("Eliminate") + 1)
                    end
                end
            end

            -- Add rest of mobs for all Objectives
<<<<<<< HEAD
            local groupAmount = math.random(6, #xi.nyzul.FloorEntities[mobFamily])
            local enemyGroup  = xi.nyzul.FloorEntities[mobFamily]
=======
            local groupAmount = math.random(6, #xi.nyzul.floorEntities[mobFamily])
            local enemyGroup  = xi.nyzul.floorEntities[mobFamily]
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
            local enemies     = {}

            for i = 1, #enemyGroup do
                table.insert(enemies, enemyGroup[i])
            end

            while groupAmount > 0 do
                local randomEnemy = math.random(1, #enemies)
                local enemy       = enemies[randomEnemy]
                local sPoint      = math.random(1, #spawnPoint)
<<<<<<< HEAD
                local SPX         = spawnPoint[sPoint][1]
                local SPY         = spawnPoint[sPoint][2]
                local SPZ         = spawnPoint[sPoint][3]
                local SPRot       = spawnPoint[sPoint][4]

                if instance:getStage() == xi.nyzul.objective.ELIMINATE_ALL_ENEMIES then
                    instance:setLocalVar("Eliminate", instance:getLocalVar("Eliminate") + 1)
                elseif instance:getStage() == xi.nyzul.objective.ELIMINATE_SPECIFIED_ENEMY and instance:getLocalVar("Nyzul_Specified_Enemy") == 0 then
                    instance:setLocalVar("Nyzul_Specified_Enemy", enemy)
                end

                GetMobByID(enemy, instance):setSpawn(SPX, SPY, SPZ, SPRot)
=======
                local sPointX     = spawnPoint[sPoint][1]
                local sPointY     = spawnPoint[sPoint][2]
                local sPointZ     = spawnPoint[sPoint][3]
                local sPointRot   = spawnPoint[sPoint][4]

                if instance:getStage() == xi.nyzul.objective.ELIMINATE_ALL_ENEMIES then
                    instance:setLocalVar("Eliminate", instance:getLocalVar("Eliminate") + 1)
                elseif
                    instance:getStage() == xi.nyzul.objective.ELIMINATE_SPECIFIED_ENEMY and
                    instance:getLocalVar("Nyzul_Specified_Enemy") == 0
                then
                    instance:setLocalVar("Nyzul_Specified_Enemy", enemy)
                end

                GetMobByID(enemy, instance):setSpawn(sPointX, sPointY, sPointZ, sPointRot)
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
                SpawnMob(enemy, instance)
                table.remove(enemies, randomEnemy)
                table.remove(spawnPoint, sPoint)

                groupAmount = groupAmount - 1
            end
        end
    end
end

-- Requirements for the first player registering the instance
<<<<<<< HEAD
instance_object.registryRequirements = function(player)
=======
instanceObject.registryRequirements = function(player)
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
    return player:hasKeyItem(xi.ki.NYZUL_ISLE_ASSAULT_ORDERS)
end

-- Requirements for further players entering an already-registered instance
<<<<<<< HEAD
instance_object.entryRequirements = function(player)
=======
instanceObject.entryRequirements = function(player)
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
    return player:hasKeyItem(xi.ki.NYZUL_ISLE_ASSAULT_ORDERS)
end

-- Called on the instance once it is created and ready
<<<<<<< HEAD
instance_object.onInstanceCreated = function(instance)
end

-- Once the instance is ready inform the requester that it's ready
instance_object.onInstanceCreatedCallback = function(player, instance)
=======
instanceObject.onInstanceCreated = function(instance)
end

-- Once the instance is ready inform the requester that it's ready
instanceObject.onInstanceCreatedCallback = function(player, instance)
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
    xi.instance.onInstanceCreatedCallback(player, instance)

    -- Kill the Nyzul Isle update spam
    for _, v in ipairs(player:getParty()) do
        if v:getZoneID() == instance:getEntranceZoneID() then
            v:updateEvent(405, 3, 3, 3, 3, 3, 3, 3)
        end
    end
end

-- When the player zones into the instance
<<<<<<< HEAD
instance_object.afterInstanceRegister = function(player)
=======
instanceObject.afterInstanceRegister = function(player)
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
    local instance = player:getInstance()

    player:messageName(ID.text.COMMENCE, player, 51)
    player:messageName(ID.text.TIME_TO_COMPLETE, player, instance:getTimeLimit())

<<<<<<< HEAD
    player:addTempItem(5348)
end

-- Instance "tick"
instance_object.onInstanceTimeUpdate = function(instance, elapsed)
=======
    player:addTempItem(xi.items.UNDERSEA_RUINS_FIREFLIES)
end

-- Instance "tick"
instanceObject.onInstanceTimeUpdate = function(instance, elapsed)
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
    xi.instance.updateInstanceTime(instance, elapsed)
end

-- On fail
<<<<<<< HEAD
instance_object.onInstanceFailure = function(instance)
=======
instanceObject.onInstanceFailure = function(instance)
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
    local chars = instance:getChars()

    for _, players in ipairs(chars) do
        players:messageSpecial(ID.text.MISSION_FAILED, 10, 10)
        players:startCutscene(1)
    end
end

-- When something in the instance calls: instance:setProgress(...)
<<<<<<< HEAD
instance_object.onInstanceProgressUpdate = function(instance, progress)
=======
instanceObject.onInstanceProgressUpdate = function(instance, progress)
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
    if progress > 0 then
        if xi.nyzul.handleProgress(instance, progress) then
            xi.nyzul.activateRuneOfTransfer(instance)
        end
    end
end

-- On win
<<<<<<< HEAD
instance_object.onInstanceComplete = function(instance)
=======
instanceObject.onInstanceComplete = function(instance)
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
end

-- Standard event hooks, these will take priority over everything apart from m_event.Script
-- Omitting this will fallthrough to the same calls in the Zone.lua
<<<<<<< HEAD
instance_object.onEventUpdate = function(player, csid, option)
=======
instanceObject.onEventUpdate = function(player, csid, option)
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
    if csid == 95 then
        local instance = player:getInstance()

        if instance:getLocalVar("runeHandler") == player:getID() then
            pickSetPoint(instance)
        end
    end
end

<<<<<<< HEAD
instance_object.onEventFinish = function(player, csid, option)
=======
instanceObject.onEventFinish = function(player, csid, option)
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
    local instance = player:getInstance()
    local chars    = instance:getChars()

    if csid == 1 then
        for _, players in ipairs(chars) do
            players:setPos(0, 0, 0, 0, xi.zone.ALZADAAL_UNDERSEA_RUINS)
        end
    elseif csid == 95 then
        if instance:getLocalVar("runeHandler") == player:getID() then
            pickMobs(instance)
            xi.nyzul.removePathos(instance)
            xi.nyzul.addFloorPathos(instance)
            instance:setLocalVar("runeHandler", 0)
        end
    end
end

<<<<<<< HEAD
return instance_object
=======
return instanceObject
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
