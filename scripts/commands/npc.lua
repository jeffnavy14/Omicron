-----------------------------------
-- func: !npc
-- desc: Test dynamic entity before its placed into a module for testing.
-- note: Will spawn after you move from your current position
-----------------------------------
require('scripts/globals/keyitems')
require('scripts/globals/npc_util')
require('scripts/globals/status')
-----------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)
    local zone = player:getZone()
    local npc = zone:insertDynamicEntity({
    objtype = xi.objType.NPC,
    name = "?????",
	look = 3613,
    x = player:getXPos(),
    y = player:getYPos(),
    z = player:getZPos(),
    rotation = player:getRotPos(),

	
	onTrigger = function(player, npc, status)
    player:PrintToPlayer("???? : I can make you a Iridal Staff.  Bring me all 8 NQ Staves and I will make you what you need", 0xD);
    player:PrintToPlayer("???? : I can also make you a Chatoyant Staff.  Bring me all 8 HQ staves and I will see what I can do", 0xD);
    end,   
	onTrade = function(player, npc)

	  ---------------------------------
      --    Ele Staff                --
      ---------------------------------
    if (trade:hasItemQty(17545,1)) and (trade:hasItemQty(17547,1)) and (trade:hasItemQty(17549,1)) and (trade:hasItemQty(17551,1))
          and (trade:hasItemQty(17553,1)) and (trade:hasItemQty(17555,1)) and (trade:hasItemQty(17557,1)) and (trade:hasItemQty(17559,1)) then
          player:tradeComplete()
          player:messageSpecial(ID.text.ITEM_OBTAINED, 18632);
          player:addItem(18632)
    end
    if trade:hasItemQty(17546,1) and trade:hasItemQty(17548,1) and trade:hasItemQty(17550,1) and trade:hasItemQty(17552,1)
          and trade:hasItemQty(17554,1) and trade:hasItemQty(17556,1) and trade:hasItemQty(17558,1) and trade:hasItemQty(17560,1) then
          player:tradeComplete()
          player:messageSpecial(ID.text.ITEM_OBTAINED, 18633);
          player:addItem(18633)
    end	  
	  end,
    })
    player:PrintToPlayer(string.format("Please move to spawn (%s)", npc:getPacketName()))
end