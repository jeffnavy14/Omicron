-----------------------------------
-- Area: Port Bastok
--  NPC: Zeldaff
-- Standard Info NPC
-----------------------------------
require("scripts/globals/events/domain_invasion")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local csid = 425
    xi.events.domainCampaign.onTrigger(player, csid)
end

entity.onEventUpdate = function(player, csid, option)
    xi.events.domainCampaign.onEventUpdate(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
