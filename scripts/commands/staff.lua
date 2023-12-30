-----------------------------------
-- func: !npc
-- desc: Test dynamic entity before its placed into a module for testing.
-- note: Will spawn after you move from your current position
-----------------------------------
require('scripts/globals/npc_util')
local ID = require("scripts/zones/Port_Jeuno/IDs")
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = ""
}

commandObj.onTrigger = function(player)
    local zone = player:getZone()
    local npc = zone:insertDynamicEntity({
    objtype = xi.objType.NPC,
    name = "No Name",
	look = 3613,
    x = player:getXPos(),
    y = player:getYPos(),
    z = player:getZPos(),
    rotation = player:getRotPos(),

	
	onTrigger = function(player, npc, status)
	player:printToPlayer("Trade me your NQ or HQ Staves Ill convert it into Chatoyant/Iridal for the low price of 50000 gil!")
    end,   
	onTrade = function(player, npc, trade)
	local level = player:getMainLvl()
	      ---------------------------------
          --    Ele Staff                --
          ---------------------------------
        if (trade:hasItemQty(17545,1) and trade:hasItemQty(17547,1) and trade:hasItemQty(17549,1) and trade:hasItemQty(17551,1)
            and trade:hasItemQty(17553,1) and trade:hasItemQty(17555,1) and trade:hasItemQty(17557,1) and trade:hasItemQty(17559,1) and trade:getGil() == 50000) then
            player:tradeComplete()
            player:messageSpecial(ID.text.ITEM_OBTAINED, 18632)
            player:addItem(18632)
        elseif (trade:hasItemQty(17546,1) and trade:hasItemQty(17548,1) and trade:hasItemQty(17550,1) and trade:hasItemQty(17552,1)
            and trade:hasItemQty(17554,1) and trade:hasItemQty(17556,1) and trade:hasItemQty(17558,1) and trade:hasItemQty(17560,1) and trade:getGil() == 50000) then
            player:tradeComplete()
            player:messageSpecial(ID.text.ITEM_OBTAINED, 18633)
            player:addItem(18633)
        end
		  -----------------------------------
          --      Chatoyant/Iridal         --
          -----------------------------------
          
          -- Iridal Staff (18632)
          if (trade:hasItemQty(18632, 1) and trade:hasItemQty( 1126, 30 ) and level >= 51) then
		    player:tradeComplete()
            player:printToPlayer("Not Sure : Thank you for the requested items. Come see me again when you are ready for another upgrade.", 0xD)
            player:addItem(18632, 1, 45, 4)
            player:setVar("IridalUpgrade", 1)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 18632)
          
          elseif (trade:hasItemQty(18632, 1) and trade:hasItemQty( 1126, 50 ) and level >= 61 and (player:getVar("IridalUpgrade") == 1)) then
            -- Complete the trade..
            player:tradeComplete()
            player:printToPlayer("Not Sure : Thank you for the requested items. Come see me again when you are ready for the next stage.", 0xD)
            player:addItem(18632, 1, 45, 9)
            player:setVar("IridalUpgrade", 2)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 18632)
          
          elseif (trade:hasItemQty(18632, 1) and trade:hasItemQty( 1127, 50 ) and level >= 71 and (player:getVar("IridalUpgrade") == 2)) then
            -- Complete the trade..
            player:tradeComplete()
            player:printToPlayer("Not Sure : Thank you for the requested items. This is where we part ways for now.", 0xD)
            player:addItem(18632, 1, 45, 14, 353, 0)
            player:setVar("IridalUpgrade", 3)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 18632)
          elseif (trade:hasItemQty(18632, 1) and player:getVar("IridalUpgrade") < 1) then
            player:printToPlayer("Not Sure : I can upgrade your Idiral Staff if you bring me 30 Beastmen Seals.", 0xD)
          elseif (trade:hasItemQty(18632, 1) and player:getVar("IridalUpgrade") == 1) then
            player:printToPlayer("Not Sure : I can upgrade your Iridal Staff if you bring me 50 Beastmen Seals.", 0xD)
          elseif (trade:hasItemQty(18632, 1) and player:getVar("IridalUpgrade") == 2) then
            player:printToPlayer("Not Sure : I can upgrade your Iridal Staff if you bring me 50 Kindred Seals.", 0xD)
          end
          
          
          -- Chatoyant Staff (18633) 
          if (trade:hasItemQty(18633, 1) and trade:hasItemQty( 1126, 30 ) and level >= 51) then
            player:printToPlayer("Not Sure : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
			player:tradeComplete()
            player:addItem(18633, 1, 45, 4)
            player:setVar("ChatoyantUpgrade", 1)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 18633)
          
          elseif (trade:hasItemQty(18633, 1) and trade:hasItemQty( 1126, 50 ) and level >= 61 and (player:getVar("ChatoyantUpgrade") == 1)) then
            -- Complete the trade..
            player:tradeComplete()
            player:printToPlayer("Not Sure : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
            player:addItem(18633, 1, 45, 9)
            player:setVar("ChatoyantUpgrade", 2)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 18633)
          
          elseif (trade:hasItemQty(18633, 1) and trade:hasItemQty( 1127, 50 ) and level >= 71 and (player:getVar("ChatoyantUpgrade") == 2)) then
            -- Complete the trade..
            player:tradeComplete()
            player:printToPlayer("Not Sure : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
            player:addItem(18633, 1, 45, 14, 353, 0)
            player:setVar("ChatoyantUpgrade", 3)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 18633)
          elseif (trade:hasItemQty(18633, 1) and player:getVar("ChatoyantUpgrade") < 1) then
            player:printToPlayer("Not Sure : I can upgrade your Chatoyant if you bring me 30 Beastmen Seals.", 0xD)
          elseif (trade:hasItemQty(18633, 1) and player:getVar("ChatoyantUpgrade") == 1) then
            player:printToPlayer("Not Sure : I can upgrade your Chatoyant if you bring me 50 Beastmen Seals.", 0xD)
          elseif (trade:hasItemQty(18633, 1) and player:getVar("ChatoyantUpgrade") == 2) then
            player:printToPlayer("Not Sure : I can upgrade your Chatoyant if you bring me 50 Kindred Seals.", 0xD)
          end
    end,
	})
    player:printToPlayer(string.format("Please move to spawn (%s)", npc:getPacketName()))
end

return commandObj