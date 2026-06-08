-----------------------------------
-- Area: Ru'Lud Gardens
--  NPC: Jamal
-----------------------------------
---@type TNpcEntity


require("modules/module_utils")
require("scripts/globals/npc_util")

local entity = {}

local trustSpellsObtained = 
{
    xi.magic.spell.SHANTOTTO,
    xi.magic.spell.KUPIPI,
    xi.magic.spell.NANAA_MIHGO,
    xi.magic.spell.AJIDO_MARUJIDO,
    xi.magic.spell.EXCENMILLE,
    xi.magic.spell.CURILLA,
    xi.magic.spell.TRION,
    xi.magic.spell.AYAME,
    xi.magic.spell.NAJI,
    xi.magic.spell.VOLKER,
    xi.magic.spell.IRON_EATER,
}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
 for i = 1, #trustSpellsObtained do
   if player:hasSpell(trustSpellsObtained[i]) then
      npc:setLocalVar('TrustsObtained', npc:getLocalVar('TrustsObtained') + 1)
    end
 end
    if npc:getLocalVar('TrustsObtained') == 11 then
       npcUtil.giveKeyItem(player, xi.keyItem.BUNDLE_OF_HALF_INSCRIBED_SCROLLS)
    else
       player:startEvent(10246)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity