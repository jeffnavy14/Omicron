-----------------------------------
--  MOB: Archaic Gear
-- Area: Nyzul Isle
-----------------------------------
<<<<<<< HEAD
local ID = require("scripts/zones/Nyzul_Isle/IDs")
require("scripts/globals/nyzul")
-----------------------------------
local entity = {}

entity.onMobEngaged= function(mob, target)
    local instance = mob:getInstance()

    if instance:getLocalVar("gearObjective") == xi.nyzul.gearObjective.AVOID_AGRO then
        local CE = 0
        local VE = 0
        CE = mob:getCE(target)
        VE = mob:getVE(target)

        if CE == 0 and VE == 0 and mob:getLocalVar("initialAgro") == 0 then
=======
local ID = require('scripts/zones/Nyzul_Isle/IDs')
require('scripts/globals/nyzul')
-----------------------------------
local entity = {}

entity.onMobEngaged = function(mob, target)
    local instance = mob:getInstance()

    if instance:getLocalVar("gearObjective") == xi.nyzul.gearObjective.AVOID_AGRO then
        local ce = mob:getCE(target)
        local ve = mob:getVE(target)

        if ce == 0 and ve == 0 and mob:getLocalVar("initialAgro") == 0 then
>>>>>>> 620d8844e8b494b1fb3f35b153a3f3d9c620d48c
            mob:setLocalVar("initialAgro", 1)
            xi.nyzul.addPenalty(mob)
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
        local instance = mob:getInstance()

        if instance:getLocalVar("gearObjective") == xi.nyzul.gearObjective.DO_NOT_DESTROY then
            xi.nyzul.addPenalty(mob)
        end
    end
end

return entity
