-----------------------------------
local ID = require("scripts/zones/Escha_RuAun/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/settings/main")
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
	local genbu = npcUtil.tradeHas(trade, {{ 3275, 3 }})
    local suzac = npcUtil.tradeHas(trade, {{ 3276, 3 }})
    local seriu = npcUtil.tradeHas(trade, {{ 3277, 3 }})
    local byakk = npcUtil.tradeHas(trade, {{ 3278, 3 }})
  
	    if player:hasKeyItem(xi.keyItem.CERULEAN_CRYSTAL) and suzac then
	        player:tradeComplete()
        	npcUtil.giveKeyItem(player, xi.keyItem.SEIRYUS_NOBILITY)
        end
        if player:hasKeyItem(xi.keyItem.CERULEAN_CRYSTAL)  seriu then
	        player:tradeComplete()
        	npcUtil.giveKeyItem(player, xi.keyItem.SUZAKUS_BENEFACTION)
        end
        if player:hasKeyItem(xi.keyItem.CERULEAN_CRYSTAL) and byakk then
	        player:tradeComplete()
        	npcUtil.giveKeyItem(player, xi.keyItem.BYAKKOS_PRIDE)
        end
        if player:hasKeyItem(xi.keyItem.CERULEAN_CRYSTAL) and genbu then
	        player:tradeComplete()
        	npcUtil.giveKeyItem(player, xi.keyItem.GENBUS_HONOR)
        end       
    end

entity.onTrigger = function(player, npc)
    if player:hasKeyItem(xi.keyItem.CERULEAN_CRYSTAL) and
       player:getRank(player:getNation()) >= 10 then
	   player:PrintToPlayer("I feel that you are worthy and are ready for these small challenges!", xi.msg.channel.NS_SAY)
       player:PrintToPlayer("If you are ready please trade me the scraps of the gods!!!!", xi.msg.channel.NS_SAY)
    else
       player:PrintToPlayer("You are not ready for what lies ahead, come back when you are more skilled!", xi.msg.channel.NS_SAY)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

end

return entity