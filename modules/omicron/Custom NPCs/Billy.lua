-----------------------------------
-- NPC: Billy
-- RUN Relic
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Abdhaljs_Isle-Purgonorgo/Zone")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
-----------------------------------
local m = Module:new("Billy")
m:setEnabled(true)

m:addOverride("xi.zones.Abdhaljs_Isle-Purgonorgo.Zone.onInitialize", function(zone)

    super(zone)

	
local Billy = zone:insertDynamicEntity({

    objtype = xi.objType.NPC,
    name = "Billy",
    look = 2713,
    x = 611,
    y = 0,
    z = 53,
	rotation = 63.75,
	
	widescan = 1,

    onTrade = function(player, npc, trade)
		if player:getCharVar("RunEmpy") == 1 and
			trade:hasItemQty(3290, 1) and -- Isgebind's Heart
			trade:hasItemQty(1711, 1) and -- molybden ingot
			trade:hasItemQty(647, 1) and -- Molybdenum Ore
			player:getCurrency("infamy") > 149
		then
			player:delCurrency("infamy", 150)
			player:setCharVar("RunEmpy", 2)
			player:PrintToPlayer("チーペ(One moment please.)", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:timer(4000, function(player)
				player:PrintToPlayer("チーペ(I hope this pleases.)", 13)
				player:addItem(26782)
				player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 26782)
				player:tradeComplete()
			end)
		elseif player:getCharVar("RunEmpy") == 3 and
			trade:hasItemQty(3290, 1) and -- Isgebind's Heart
			trade:hasItemQty(2408, 1) and -- flocon-de-mer
			trade:hasItemQty(1769, 1) and -- Galateia
			player:getCurrency("infamy") > 199
		then 
			player:delCurrency("infamy", 200)
			player:setCharVar("RunEmpy", 4)
			player:PrintToPlayer("チーペ(One moment please.)", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:timer(4000, function(player)
				player:PrintToPlayer("チーペ(I hope this pleases.)", 13)
				player:addItem(26940)
				player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 26940)
				player:tradeComplete()
			end)	
		elseif player:getCharVar("RunEmpy") == 5 and
			trade:hasItemQty(3290, 1) and -- Isgebind's Heart
			trade:hasItemQty(2408, 1) and -- flocon-de-mer
			trade:hasItemQty(2169, 1) and -- Cerberus Hide
			player:getCurrency("infamy") > 99
		then
			player:delCurrency("infamy", 100)
			player:setCharVar("RunEmpy", 6)
			player:PrintToPlayer("チーペ(One moment please.)", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:timer(4000, function(player)
				player:PrintToPlayer("チーペ(I hope this pleases.)", 13)
				player:addItem(27094)
				player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 27094)
				player:tradeComplete()
			end)
		elseif player:getCharVar("RunEmpy") == 7 and
			trade:hasItemQty(3290, 1) and -- Isgebind's Heart
			trade:hasItemQty(1769, 1) and -- Galateia
			trade:hasItemQty(2169, 1) and -- Cerberus Hide
			player:getCurrency("infamy") > 249
		then
			player:delCurrency("infamy", 250)
			player:setCharVar("RunEmpy", 8)
			player:PrintToPlayer("チーペ(One moment please.)", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:timer(4000, function(player)
				player:PrintToPlayer("チーペ(I hope this pleases.)", 13)
				player:addItem(27279)
				player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 27279)
				player:tradeComplete()
			end)
		elseif player:getCharVar("RunEmpy") == 9 and
			trade:hasItemQty(3290, 1) and -- Isgebind's Heart
			trade:hasItemQty(1711, 1) and -- molybden ingot
			trade:hasItemQty(2169, 1) and -- Cerberus Hide
			player:getCurrency("infamy") > 199
		then
			player:delCurrency("infamy", 200)
			player:setCharVar("RunEmpy", 10)
			player:PrintToPlayer("チーペ(One moment please.)", 0, npc:getPacketName())
			player:PrintToPlayer("...", 13)
			player:timer(4000, function(player)
				player:PrintToPlayer("チーペ(I hope this pleases.)", 13)
				player:addItem(27453)
				player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, 27453)
				player:tradeComplete()
			end)
		end
	end,
	
	onTrigger = function(player, npc, status)
		if player:getCharVar("RunEmpy") == 1 then
			player:PrintToPlayer("チーペ(Hello)", 0, npc:getPacketName())
			player:PrintToPlayer("カア(I'll need Isgebind's heart, molybdenum ingot, molybdenum ore, with 150 infamy", 13)
		elseif player:getCharVar("RunEmpy") == 2 then
			player:PrintToPlayer("チーペ(Hello)", 0, npc:getPacketName())
			player:PrintToPlayer("カア(I'll need Isgebind's heart, flocon-de-mer, galateia, with 200 infamy", 13)
			player:setCharVar("RunEmpy", 3)
		elseif player:getCharVar("RunEmpy") == 3 then
			player:PrintToPlayer("チーペ(Hello)", 0, npc:getPacketName())
			player:PrintToPlayer("カア(I'll need Isgebind's heart, flocon-de-mer, galateia, with 200 infamy", 13)
		elseif player:getCharVar("RunEmpy") == 4 then
			player:PrintToPlayer("チーペ(Hello)", 0, npc:getPacketName())
			player:PrintToPlayer("カア(I'll need Isgebind's heart, flocon-de-mer, cerberus hide with 100 infamy", 13)
			player:setCharVar("RunEmpy", 5)
		elseif player:getCharVar("RunEmpy") == 5 then
			player:PrintToPlayer("チーペ(Hello)", 0, npc:getPacketName())
			player:PrintToPlayer("カア(I'll need Isgebind's heart, flocon-de-mer, cerberus hide with 100 infamy", 13)
		elseif player:getCharVar("RunEmpy") == 6 then
			player:PrintToPlayer("チーペ(Hello)", 0, npc:getPacketName())
			player:PrintToPlayer("カア(I'll need Isgebind's heart, galateia, cerberus hide with 250 infamy", 13)
			player:setCharVar("RunEmpy", 7)
		elseif player:getCharVar("RunEmpy") == 7 then
			player:PrintToPlayer("チーペ(Hello)", 0, npc:getPacketName())
			player:PrintToPlayer("カア(I'll need Isgebind's heart, galateia, cerberus hide with 250 infamy", 13)
		elseif player:getCharVar("RunEmpy") == 8 then
			player:PrintToPlayer("チーペ(Hello)", 0, npc:getPacketName())
			player:PrintToPlayer("カア(I'll need Isgebind's heart, molybdenum ingot, cerberus hide with 200 infamy", 13)
			player:setCharVar("RunEmpy", 9)
		elseif player:getCharVar("RunEmpy") == 9 then
			player:PrintToPlayer("チーペ(Hello)", 0, npc:getPacketName())
			player:PrintToPlayer("カア(I'll need Isgebind's heart, molybdenum ingot, cerberus hide with 200 infamy", 13)
		elseif player:getCharVar("RunEmpy") == 10 then
			player:PrintToPlayer("チーペ(Hello)", 0, npc:getPacketName())
		elseif player:getCharVar("RunAF") < 10 then
			player:PrintToPlayer("Well ain't you a purdy lil' thang, be careful out there y'hear.", 0, npc:getPacketName())
		else
			player:PrintToPlayer("チーペ(Hello)", 0, npc:getPacketName())
			player:setCharVar("RunEmpy", 1)
		end		
	end, 
	
    })
    utils.unused(Billy)
end)

return m