-----------------------------------
--  MOB: Gem Heister Roorooroon
-- Area: Nyzul Isle
-- Info: Enemy Leader, Thief job, runs around dropping bombs
-----------------------------------
<<<<<<< HEAD
require("scripts/globals/pathfind")
require("scripts/globals/status")
require("scripts/globals/nyzul")
=======
require('scripts/globals/pathfind')
require('scripts/globals/status')
require('scripts/globals/nyzul')
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
-----------------------------------
local entity = {}

local function pickRunPoint(mob)
    mob:setLocalVar("ignore", 1)
<<<<<<< HEAD
    local distance   = math.random(10, 25)
    local angle      = math.random() * math.pi
=======
    -- local distance   = math.random(10, 25)
    -- local angle      = math.random() * math.pi
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
    local fromTarget = mob:getTarget()

    if fromTarget == nil then
        fromTarget = mob
    end

    -- local pos = GetFurthestValidPosition(fromTarget, distance, angle)
    -- ^ We lack this function. TODO: Add thisfunction. Below code is a workarround
    local pos = mob:getPos()

    mob:setLocalVar("posX", pos.x)
    mob:setLocalVar("posY", pos.y)
    mob:setLocalVar("posZ", pos.z)
    mob:pathTo(pos.x, pos.y, pos.z, xi.path.flag.RUN)
end

local function continuePoints(mob)
    local pos    = mob:getPos()
    local pathX  = mob:getLocalVar("posX")
    local pathY  = mob:getLocalVar("posY")
    local pathZ  = mob:getLocalVar("posZ")
    local cycles = mob:getLocalVar("cycles")

    if pos.x ~= pathX and pos.z ~= pathZ then
        mob:pathTo(pathX, pathY, pathZ, xi.path.flag.RUN)
    elseif cycles > 0 then
        mob:setLocalVar("cycles", cycles - 1)
        pickRunPoint(mob)
    else
        mob:setLocalVar("runTime", mob:getBattleTime() + math.random(10, 25))
        mob:setLocalVar("ignore", 0)
    end
end

local function dropBomb(mob)
    local instance = mob:getInstance()
    local bombMob  = GetMobByID(mob:getID() + 1, instance)
    local target   = mob:getTarget()
    local pos      = mob:getPos()

    bombMob:setPos(pos.x, pos.y, pos.z, pos.rot)
<<<<<<< HEAD
    bombMob:setStatus(xi.status.UPDATE)
=======
    bombMob:setStatus(xi.status.MOB)
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c

    if target ~= nil then
        bombMob:updateEnmity(target)
        bombMob:timer(1000, function(bomb)
            bomb:useMobAbility(1838)
        end)
    end

    bombMob:timer(4500, function(bomb)
        bomb:setStatus(xi.status.DISAPPEAR)
    end)
end

entity.onMobSpawn = function(mob)
    local instance = mob:getInstance()

    SpawnMob(mob:getID() + 1, instance)
end

<<<<<<< HEAD
entity.onMobEngaged= function(mob, target)
=======
entity.onMobEngaged = function(mob, target)
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
    mob:setLocalVar("runTime", math.random(10, 25))
end

entity.onMobFight = function(mob, target)
    local instance   = mob:getInstance()
    local battletime = mob:getBattleTime()
    local runTime    = mob:getLocalVar("runTime")
    local ignore     = mob:getLocalVar("ignore")

    -- setup inital run around logic point and how many cycle of points
    if battletime > runTime and ignore == 0 then
        mob:setLocalVar("cycles", math.random(3, 6))
        pickRunPoint(mob)
    -- make sure mob keeps running and cycle to new plotted points
    elseif ignore == 1 then
        continuePoints(mob)

        if GetMobByID(mob:getID() + 1, instance):getStatus() == xi.status.DISAPPEAR then
            if math.random(1, 5) == 2 then -- TODO:add sleep check here aswell
                dropBomb(mob)
            end
        end
    end
end

<<<<<<< HEAD
entity.onMobDeath = function(mob, player, isKiller, noKiller)
    if isKiller or noKiller then
=======
entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
        xi.nyzul.spawnChest(mob, player)
        xi.nyzul.enemyLeaderKill(mob)
    end
end

return entity
