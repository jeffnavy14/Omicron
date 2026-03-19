-----------------------------------
-- The Colosseum
-- !instance 40000
-----------------------------------
local ID = zones[xi.zone.MAQUETTE_ABDHALJS_LEGION_B]
require("modules/omicronXI/global/colosseum")
-----------------------------------
local instanceObject = {}

instanceObject.onInstanceCreated = function(instance, player)
    omicron.colosseum_util.onInstanceCreated(instance, player)
end

instanceObject.onInstanceCreatedCallback = function(player, instance)
    omicron.colosseum_util.onInstanceCreatedCallback(player, instance)
end

instanceObject.afterInstanceRegister = function(player, instance)
    omicron.colosseum_util.afterInstanceRegister(player, instance)
end

instanceObject.onInstanceTimeUpdate = function(instance, elapsed)
    omicron.colosseum_util.onInstanceTimeUpdate(instance, elapsed)
end

instanceObject.onInstanceFailure = function(instance)
    omicron.colosseum_util.onInstanceFailure(instance)
end

instanceObject.onInstanceProgressUpdate = function(instance, progress)
end

instanceObject.onInstanceComplete = function(instance)
    omicron.colosseum_util.onInstanceComplete(instance)
end

instanceObject.onEventUpdate = function(player, csid, option, npc)
    omicron.colosseum_util.onEventUpdate(player, csid, option, npc)
end

instanceObject.onEventFinish = function(player, csid, option, npc)
    omicron.colosseum_util.onEventFinish(player, csid, option, npc)
end

return instanceObject