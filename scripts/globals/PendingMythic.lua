--Scripts/Globals/PendingMythic.lua--
-----------------------------------
local ID = require("scripts/zones/Caedarva_Mire/IDs")
-----------------------------------
xi = xi or {}
xi.PendingMythic = xi.PendingMythic or {}

xi.PendingMythic.onTrade = function(player, npc, trade)
	local tinninsFang = npcUtil.tradeHas(trade, 2609)
	local sarameyasHide = npcUtil.tradeHas(trade, 2619)
	local tygersTail = npcUtil.tradeHas(trade, 2629)
	local gurfurlursHelmet = npcUtil.tradeHas(trade, 2356)
	local medusasArmlet = npcUtil.tradeHas(trade, 2357)
	local jajasChestplate = npcUtil.tradeHas(trade, 2355)
	local ancientBeastcoins = trade:hasItemQty(2187, 99)
	local catsEye = npcUtil.tradeHas(trade, 3443)
	local titleCheck = (player:hasTitle(xi.title.CERBERUS_MUZZLER) and player:hasTitle(xi.title.HYDRA_HEADHUNTER) and player:hasTitle(xi.title.KHIMAIRA_CARVER) and
    player:hasTitle(xi.title.GORGONSTONE_SUNDERER) and player:hasTitle(xi.title.GORGONSTONE_SUNDERER) and player:hasTitle(xi.title.SHINING_SCALE_RIFLER))
	
	if (player:getCharVar("PendingMythic") == 1 and npcUtil.tradeHas(trade, 18971)) then -- conqueror
	    player:tradeComplete()
		player:startEvent(25, 1)
		player:addItem(18991)
	elseif (player:getCharVar("PendingMythic") == 1 and npcUtil.tradeHas(trade, 18972)) then -- glanzfaust
	    player:tradeComplete()
		player:startEvent(25, 2)
		player:addItem(18992)
	elseif (player:getCharVar("PendingMythic") == 1 and npcUtil.tradeHas(trade, 18973)) then -- yagrush
	    player:tradeComplete()
		player:startEvent(25, 3)
		player:addItem(18993)
	elseif (player:getCharVar("PendingMythic") == 1 and npcUtil.tradeHas(trade, 18974)) then -- laevateinn
	    player:tradeComplete()
		player:startEvent(25, 4)
		player:addItem(18994)
	elseif (player:getCharVar("PendingMythic") == 1 and npcUtil.tradeHas(trade, 18975)) then -- murgleis
	    player:tradeComplete()
		player:startEvent(25, 5)
		player:addItem(18995)
	elseif (player:getCharVar("PendingMythic") == 1 and npcUtil.tradeHas(trade, 18976)) then -- vajra
	    player:tradeComplete()
		player:startEvent(25, 6)
		player:addItem(18996)
	elseif (player:getCharVar("PendingMythic") == 1 and npcUtil.tradeHas(trade, 18977)) then -- burtgang
	    player:tradeComplete()
		player:startEvent(25, 7)
		player:addItem(18997)
	elseif (player:getCharVar("PendingMythic") == 1 and npcUtil.tradeHas(trade, 18978)) then -- liberator
	    player:tradeComplete()
		player:startEvent(25, 8)
		player:addItem(18998)
	elseif (player:getCharVar("PendingMythic") == 1 and npcUtil.tradeHas(trade, 18979)) then -- aymur
	    player:tradeComplete()
		player:startEvent(25, 9)
		player:addItem(18999)
	elseif (player:getCharVar("PendingMythic") == 1 and npcUtil.tradeHas(trade, 18980)) then -- carnwenhan
	    player:tradeComplete()
		player:startEvent(25, 10)
		player:addItem(19000)
	elseif (player:getCharVar("PendingMythic") == 1 and npcUtil.tradeHas(trade, 18981)) then -- gastraphetes
	    player:tradeComplete()
		player:startEvent(25, 11)
		player:addItem(19001)
	elseif (player:getCharVar("PendingMythic") == 1 and npcUtil.tradeHas(trade, 18982)) then -- kogarasumaru
	    player:tradeComplete()
		player:startEvent(25, 12)
		player:addItem(19002)
	elseif (player:getCharVar("PendingMythic") == 1 and npcUtil.tradeHas(trade, 18983)) then -- nagi
	    player:tradeComplete()
		player:startEvent(25, 13)
	elseif (player:getCharVar("PendingMythic") == 1 and npcUtil.tradeHas(trade, 18984)) then -- ryunohige
	    player:tradeComplete()
		player:startEvent(25, 14)
		player:addItem(19004)
	elseif (player:getCharVar("PendingMythic") == 1 and npcUtil.tradeHas(trade, 18985)) then -- nirvana
	    player:tradeComplete()
		player:startEvent(25, 15)
		player:addItem(19005)
	elseif (player:getCharVar("PendingMythic") == 1 and npcUtil.tradeHas(trade, 18986)) then -- tizona
	    player:tradeComplete()
		player:startEvent(25, 16)
		player:addItem(19006)
	elseif (player:getCharVar("PendingMythic") == 1 and npcUtil.tradeHas(trade, 18987)) then -- death_penalty
	    player:tradeComplete()
		player:startEvent(25, 17)
		player:addItem(19007)
	elseif (player:getCharVar("PendingMythic") == 1 and npcUtil.tradeHas(trade, 18988)) then -- kenkonken
	    player:tradeComplete()
		player:startEvent(25, 18)
		player:addItem(19008)
	elseif (player:getCharVar("PendingMythic") == 1 and npcUtil.tradeHas(trade, 18969)) then -- terpsichore
	    player:tradeComplete()
		player:startEvent(25, 19)
		player:addItem(18989)
	elseif (player:getCharVar("PendingMythic") == 1 and npcUtil.tradeHas(trade, 18970)) then -- tupsimati
	    player:tradeComplete()
		player:startEvent(25, 20)
		player:addItem(18990)
	elseif (titleCheck == true and tinninsFang and sarameyasHide and tygersTail and gurfurlursHelmet and medusasArmlet and jajasChestplate and catsEye and ancientBeastcoins) then
		--player:tradeComplete()
		player:setCharVar("PendingMythic", 1)
		player:PrintToPlayer("Balrahn Eidolon: I have nearly everything I need... Come back with your base weapon to complete the upgrade.", 0xD)
	end	
end
xi.PendingMythic.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.SEAPRINCES_TOMBSTONE)
end

xi.PendingMythic.onEventUpdate = function(player,csid,option,input)
end

xi.PendingMythic.onEventFinish = function(player, csid, option)
    if csid == 25 and option == 1 then
	elseif csid == 25 and option == 2 then
    elseif csid == 25 and option == 3 then
    elseif csid == 25 and option == 4 then
    elseif csid == 25 and option == 5 then
    elseif csid == 25 and option == 6 then	
    elseif csid == 25 and option == 7 then
    elseif csid == 25 and option == 8 then
    elseif csid == 25 and option == 9 then
    elseif csid == 25 and option == 10 then
    elseif csid == 25 and option == 11 then
    elseif csid == 25 and option == 12 then
    elseif csid == 25 and option == 13 then
    elseif csid == 25 and option == 14 then
    elseif csid == 25 and option == 15 then
    elseif csid == 25 and option == 16 then
    elseif csid == 25 and option == 17 then
    elseif csid == 25 and option == 18 then
    elseif csid == 25 and option == 19 then
	elseif csid == 25 and option == 20 then	
   
   end
	player:setCharVar("PendingMythic", 1)
	
end