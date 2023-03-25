---------------------------------------
-- Tiny Fighter
-- Mythic Maker
---------------------------------------
require("modules/module_utils")
require("scripts/zones/The_Colosseum/Zone")
require('scripts/globals/npc_util')
require("scripts/globals/utils")
---------------------------------------
local m = Module:new("TinyFighter")
m:setEnabled(true)

m:addOverride("xi.zones.The_Colosseum.Zone.onInitialize", function(zone)
	super(zone)

local tradedItem = 0
local tradeTable =
	-- [TradeID] = { trade = (ItemID), reward = ItemID),
{
    --  item,reward (astral notebook reward except for choco whistle) (trade reward trade to Mapitoto for mount)
    [ 1] =  { trade = { 18492 }, reward = 21757 }, -- WAR
    [ 2] =  { trade = { 18753 }, reward = 20510 }, -- MNK
    [ 3] =  { trade = { 18851 }, reward = 21078 }, -- WHM
    [ 4] =  { trade = { 18589 }, reward = 22062 }, -- BLM
    [ 5] =  { trade = { 17742 }, reward = 20686 }, -- RDM
    [ 6] =  { trade = { 18003 }, reward = 20585 }, -- THF
    [ 7] =  { trade = { 17744 }, reward = 20687 }, -- PLD
    [ 8] =  { trade = { 18944 }, reward = 21809 }, -- DRK
    [ 9] =  { trade = { 17956 }, reward = 21751 }, -- BST
    [10] =  { trade = { 18034 }, reward = 20586 }, -- BRD
    [11] =  { trade = { 18719 }, reward = 21266 }, -- RNG
    [12] =  { trade = { 18443 }, reward = 21955 }, -- SAM
    [13] =  { trade = { 18426 }, reward = 21907 }, -- NIN
    [14] =  { trade = { 18120 }, reward = 21858 }, -- DRG
    [15] =  { trade = { 18590 }, reward = 22063 }, -- SMN
    [16] =  { trade = { 17743 }, reward = 20688 }, -- BLU
    [17] =  { trade = { 18720 }, reward = 21268 }, -- COR
    [18] =  { trade = { 18754 }, reward = 20511 }, -- PUP
    [19] =  { trade = { 19102 }, reward = 20584 }, -- DNC
    [20] =  { trade = { 18592 }, reward = 22061 }, -- SCH
    [21] =  { trade = { 21066 }, reward = 21080 }, -- GEO
    [22] =  { trade = { 20749 }, reward = 21685 }, -- RUN
}
	
		local Tiny Fighter = zone:insertDynamicEntity({
			objtype = xi.objType.NPC,
			name = "Tiny Fighter",
			look = 6,
			x = -579.000,
			y = 0.000,
			z = 56.000,
			rotation = 95.625,
			
		onTrigger = function(player, npc)
			if player:getCharVar("[TinyFighter]Stage") == 0 then
				player:PrintToPlayer("Greetings friend, I'm here to upgrade Vigil Weapons to a more complete version of themselves.", 0, npc:getPacketName())
				player:PrintToPlayer("I'll guide you to what items I'll need to do so when you bring me one", xi.msg.channel.NS_SAY)
			elseif player:getCharVar("[TinyFighter]Stage") == 1 then 
				player:PrintToPlayer("All right, for me to get started I will need a Balrahn's Eyepatch, Tinnin's Fang, Sarameya's Hide, Tyger's Tail.", xi.msg.channel.NS_SAY)
				player:PrintToPlayer("Also I will need a Copy of Wyrmseeker Areuhat.", 13)
			elseif player:getCharVar("[TinyFighter]Stage") == 2 then
				player:PrintToPlayer("I know. its the painfully tedious part, one Catseye please.", 0, npc:getPacketName())
			elseif player:getCharVar("[TinyFighter]Stage") == 3 and
				os.time() > player:getCharVar("[TinyFighter]time")
			then
				local reward = player:getCharVar("[TinyFighter]item")				
       		    if npcUtil.giveItem(player, reward) then
       		    	   player:setCharVar("[TinyFighter]item", 0)
       		    	   player:setCharVar("[TinyFighter]time", 0)
					   player:setCharVar("[TinyFighter]Stage", 0)
       		    end
			elseif player:getCharVar("[TinyFighter]Stage") == 3 and
				os.time() < player:getCharVar("[TinyFighter]time")
			then
				player:PrintToPlayer("We're almost there, please return tomorrow.", 0, npc:getPacketName())
			end
		end,
		
		onTrade = function(player, npc, trade)
			if player:getCharVar("[TinyFighter]Stage") == 1 then
				if trade:hasItemQty(2571, 1) and 
					trade:hasItemQty(2609, 1) and
					trade:hasItemQty(2619, 1) and
					trade:hasItemQty(2629, 1) and
					trade:hasItemQty(2489, 1)
				then
					player:PrintToPlayer("Excellent work my friend. Now the painful part, one Catseye please.", 0, npc:getPacketName())
					player:setCharVar("[TinyFighter]Stage", 2)
					player:tradeComplete()
				end
				
			elseif player:getCharVar("[TinyFighter]Stage") == 2 then
			
				if trade:hasItemQty(3443, 1) then
					player:setCharVar("[TinyFighter]Stage", 3)
					player:PrintToPlayer("Excellent work my friend. The weapon will be ready by tomorrow.", 0, npc:getPacketName())
					player:setCharVar("[TinyFighter]time", getVanaMidnight())
					player:tradeComplete()
				end
			
			-- item check
			elseif player:getCharVar("[TinyFighter]Stage") == 0 then
			
				local tradeedItem = 0
	
				 if player:getCharVar("[TinyFighter]item") == 0 then
					for k, v in pairs(tradeTable) do
						if npcUtil.tradeHasExactly(trade, v.trade) then
							tradeedItem = k
							break
						end
					end
				end
				
				if tradeedItem > 0 then
					local rewardItemId = tradeTable[tradeedItem].reward -- looks in *table name*[then itemID].matches to rewardID
					--local baseItem = tradeTable[tradedItem].trade
					
					player:setCharVar("[TinyFighter]item", rewardItemId) -- assigns rewardID to CharVar
					local reward = player:getCharVar("[TinyFighter]item") -- assigns char var to local
					player:confirmTrade()
					player:setCharVar("[TinyFighter]Stage", 1)
					player:PrintToPlayer("Tiny Fighter: All right, for me to get started I will need a Balrahn's Eyepatch, Tinnin's Fang, Sarameya's Hide, Tyger's Tail.", 13)
					player:PrintToPlayer("Also I will need a Copy of Wyrmseeker Areuhat.", 13)
				
				end
			end
		end
		
	})
	
	utils.unused(TinyFighter)	
		
end)

return m