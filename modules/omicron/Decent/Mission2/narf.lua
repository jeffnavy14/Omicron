-----------------------------------
-- Island Reive Quest Giver and Spawners
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Abdhaljs_Isle-Purgonorgo/Zone")
require('scripts/globals/npc_util')
require("scripts/globals/alitems")
--require("modules/omicron/Decent/IslandInvasion")
-----------------------------------

local m = Module:new("IslandReive")
m:setEnabled(true)

local islandID = require("scripts/zones/Abdhaljs_Isle-Purgonorgo/IDs")

local augdrops =
{
	xi.alitems.DESPAIR_HELM,
	xi.alitems.DESPAIR_MAIL,
	xi.alitems.DESPAIR_FINGER_GAUNTLETS,
	xi.alitems.DESPAIR_CUISSES,
	xi.alitems.DESPAIR_GREAVES,
	xi.alitems.ESCHITE_HELM,
	xi.alitems.ESCHITE_BREASTPLATE,
	xi.alitems.ESCHITE_GAUNTLETS,
	xi.alitems.ESCHITE_CUISSES,
	xi.alitems.ESCHITE_GREAVES,
	xi.alitems.RAWHIDE_MASK,
	xi.alitems.RAWHIDE_VEST,
	xi.alitems.RAWHIDE_GLOVES,
	xi.alitems.RAWHIDE_TROUSERS,
	xi.alitems.RAWHIDE_BOOTS,
	xi.alitems.PSYCLOTH_TIARA,
	xi.alitems.PSYCLOTH_VEST,
	xi.alitems.PSYCLOTH_MANILLAS,
	xi.alitems.PSYCLOTH_LAPPAS,
	xi.alitems.PSYCLOTH_BOOTS,
	xi.alitems.PURSUERS_BERET,
	xi.alitems.PURSUERS_DOUBLET,
	xi.alitems.PURSUERS_CUFFS,
	xi.alitems.PURSUERS_PANTS,
	xi.alitems.PURSUERS_GAITERS,
	xi.alitems.VANYA_HOOD,
	xi.alitems.VANYA_ROBE,
	xi.alitems.VANYA_CUFFS,
	xi.alitems.VANYA_SLOPS,
	xi.alitems.VANYA_CLOGS,
	xi.alitems.NAGA_SOMEN,
	xi.alitems.NAGA_SAMUE,
	xi.alitems.NAGA_TEKKO,
	xi.alitems.NAGA_HAKAMA,
	xi.alitems.NAGA_KYAHAN,
}

-- Use the other table if LSB is not updated
local augs =
{
	[xi.alitems.DESPAIR_HELM] =
	{
		augments =
		{	
			{ aug = 512, min = 1, max = 14 },
			{ aug = 39,  min = 1, max = 6  },
			{ aug = 142, min = 1, max = 2  },
		},
	},
	
	[xi.alitems.DESPAIR_MAIL] =
	{
		augments =
		{	
			{ aug = 25,  min = 1, max = 24 },
			{ aug = 37,  min = 1, max = 19 },
			{ aug = 143, min = 1, max = 2  },
		},
	},
	
	[xi.alitems.DESPAIR_FINGER_GAUNTLETS] =
	{
		augments =
		{	
			{ aug = 27,  min = 1, max = 24 },
			{ aug = 29,  min = 1, max = 19 },
			{ aug = 212, min = 1, max = 9  },
		},
	},
	
	[xi.alitems.DESPAIR_CUISSES] =
	{
		augments =
		{	
			{ aug = 515, min = 1, max = 9  },
			{ aug = 31,  min = 1, max = 19 },
			{ aug = 195, min = 1, max = 6  },
		},
	},
	
	[xi.alitems.DESPAIR_GREAVES] =
	{
		augments =
		{	
			{ aug = 513, min = 1, max = 9 },
			{ aug = 512, min = 1, max = 6 },
			{ aug = 54,  min = 1, max = 2 },
		},
	},
	
	[xi.alitems.ESCHITE_HELM] =
	{
		augments =
		{	
			{ aug = 512, min = 1, max = 8 },
			{ aug = 514, min = 1, max = 6 },
			{ aug = 329, min = 1, max = 6 },
		},
	},
	
	[xi.alitems.ESCHITE_BREASTPLATE] =
	{
		augments =
		{	
			{ aug = 25,  min = 1, max = 14 },
			{ aug = 514, min = 1, max = 6  },
			{ aug = 71,  min = 1, max = 3  },
		},
	},
	
	[xi.alitems.ESCHITE_GAUNTLETS] =
	{
		augments =
		{	
			{ aug = 23,  min = 1, max = 19 },
			{ aug = 143, min = 1, max = 3  },
			{ aug = 39,  min = 1, max = 6  },
		},
	},
	
	[xi.alitems.ESCHITE_CUISSES] =
	{
		augments =
		{	
			{ aug = 133, min = 1, max = 24 },
			{ aug = 141, min = 1, max = 5  },
			{ aug = 140, min = 1, max = 4  },
		},
	},
	
	[xi.alitems.ESCHITE_GREAVES] =
	{
		augments =
		{	
			{ aug = 512, min = 1, max = 14 },
			{ aug = 1,   min = 1, max = 49 },
			{ aug = 142, min = 1, max = 4  },
		},
	},
	
	[xi.alitems.NAGA_SOMEN] =
	{
		augments =
		{	
			{ aug = 23, min = 1, max = 14 },
			{ aug = 27, min = 1, max = 24 },
			{ aug = 40, min = 1, max = 5  },
		},
	},
	
	[xi.alitems.NAGA_SAMUE] =
	{
		augments =
		{	
			{ aug = 78,  min = 1, max = 39 },
			{ aug = 513, min = 1, max = 9  },
			{ aug = 25,  min = 1, max = 19 },
		},
	},
	
	[xi.alitems.NAGA_TEKKO] =
	{
		augments =
		{	
			{ aug = 126, min = 1, max = 10 },
			{ aug = 100, min = 1, max = 19 },
			{ aug = 101, min = 1, max = 19 },
		},
	},
	
	[xi.alitems.NAGA_HAKAMA] =
	{
		augments =
		{	
			{ aug = 25, min = 1, max = 19 },
			{ aug = 29, min = 1, max = 24 },
			{ aug = 41, min = 1, max = 3  },
		},
	},
	
	[xi.alitems.NAGA_KYAHAN] =
	{
		augments =
		{	
			{ aug = 1795, min = 1, max = 10 },
			{ aug = 1793, min = 1, max = 10 },
			{ aug = 1792, min = 1, max = 10 },
		},
	},
	
	[xi.alitems.PSYCLOTH_TIARA] =
	{
		augments =
		{	
			{ aug = 23,  min = 1, max = 19 },
			{ aug = 140, min = 1, max = 9  },
			{ aug = 516, min = 1, max = 6  },
		},
	},
	
	[xi.alitems.PSYCLOTH_VEST] =
	{
		augments =
		{	
			{ aug = 292, min = 1, max = 19 },
			{ aug = 516, min = 1, max = 6  },
			{ aug = 40,  min = 1, max = 6  },
		},
	},
	
	[xi.alitems.PSYCLOTH_MANILLAS] =
	{
		augments =
		{	
			{ aug = 82,  min = 1, max = 39 },
			{ aug = 233, min = 1, max = 3  },
			{ aug = 101, min = 1, max = 24 },
		},
	},
	
	[xi.alitems.PSYCLOTH_LAPPAS] =
	{
		augments =
		{	
			{ aug = 82,  min = 1, max = 39 },
			{ aug = 35,  min = 1, max = 14 },
			{ aug = 140, min = 1, max = 6  },
		},
	},
	
	[xi.alitems.PSYCLOTH_BOOTS] =
	{
		augments =
		{	
			{ aug = 100, min = 1, max = 19 },
			{ aug = 101, min = 1, max = 19 },
			{ aug = 104, min = 1, max = 6  },
		},
	},
	
	[xi.alitems.PURSUERS_BERET] =
	{
		augments =
		{	
			{ aug = 29,  min = 1, max = 14 },
			{ aug = 40,  min = 1, max = 5  },
			{ aug = 195, min = 1, max = 6  },
		},
	},
	
	[xi.alitems.PURSUERS_DOUBLET] =
	{
		augments =
		{	
			{ aug = 78,  min = 1, max = 25 },
			{ aug = 41,  min = 1, max = 3  },
			{ aug = 211, min = 1, max = 5  },
		},
	},
	
	[xi.alitems.PURSUERS_CUFFS] =
	{
		augments =
		{	
			{ aug = 29,  min = 1, max = 14 },
			{ aug = 512, min = 1, max = 6  },
			{ aug = 54,  min = 1, max = 3  },
		},
	},
	
	[xi.alitems.PURSUERS_PANTS] =
	{
		augments =
		{	
			{ aug = 512, min = 1, max = 6 },
			{ aug = 515, min = 1, max = 9 },
			{ aug = 513, min = 1, max = 6 },
		},
	},
	
	[xi.alitems.PURSUERS_GAITERS] =
	{
		augments =
		{	
			{ aug = 27,  min = 1, max = 9  },
			{ aug = 139, min = 1, max = 9  },
			{ aug = 212, min = 1, max = 14 },
		},
	},
	
	[xi.alitems.RAWHIDE_MASK] =
	{
		augments =
		{	
			{ aug = 25,  min = 1, max = 14 },
			{ aug = 100, min = 1, max = 19 },
			{ aug = 101, min = 1, max = 14 },
		},
	},
	
	[xi.alitems.RAWHIDE_VEST] =
	{
		augments =
		{	
			{ aug = 78,  min = 1, max = 24 },
			{ aug = 195, min = 1, max = 6  },
			{ aug = 144, min = 1, max = 1  },
		},
	},
	
	[xi.alitems.RAWHIDE_GLOVES] =
	{
		augments =
		{	
			{ aug = 35,  min = 1, max = 14 },
			{ aug = 516, min = 1, max = 6  },
			{ aug = 517, min = 1, max = 6  },
		},
	},
	
	[xi.alitems.RAWHIDE_TROUSERS] =
	{
		augments =
		{	
			{ aug = 82,  min = 1, max = 24 },
			{ aug = 140, min = 1, max = 4  },
			{ aug = 138, min = 1, max = 1  },
		},
	},
	
	[xi.alitems.RAWHIDE_BOOTS] =
	{
		augments =
		{	
			{ aug = 512, min = 1, max = 9  },
			{ aug = 25,  min = 1, max = 14 },
			{ aug = 142, min = 1, max = 4  },
		},
	},
	
	[xi.alitems.VANYA_HOOD] =
	{
		augments =
		{	
			{ aug = 82,  min = 1, max = 24 },
			{ aug = 140, min = 1, max = 9  },
			{ aug = 49,  min = 1, max = 1  },
		},
	},
	
	[xi.alitems.VANYA_ROBE] =
	{
		augments =
		{	
			{ aug = 78,  min = 1, max = 24 },
			{ aug = 82,  min = 1, max = 24 },
			{ aug = 138, min = 1, max = 1  },
		},
	},
	
	[xi.alitems.VANYA_CUFFS] =
	{
		augments =
		{	
			{ aug = 518, min = 1, max = 9  },
			{ aug = 297, min = 1, max = 9  },
			{ aug = 35,  min = 1, max = 19 },
		},
	},
	
	[xi.alitems.VANYA_SLOPS] =
	{
		augments =
		{	
			{ aug = 78, min = 1, max = 24 },
			{ aug = 37, min = 1, max = 14 },
			{ aug = 54, min = 1, max = 2  },
		},
	},
	
	[xi.alitems.VANYA_CLOGS] =
	{
		augments =
		{	
			{ aug = 329, min = 1, max = 4  },
			{ aug = 323, min = 1, max = 14 },
			{ aug = 141, min = 1, max = 5  },
		},
	},
}

local MakeItem = function(player, itemid, npc)
	local baseTier = math.random(1, 100)
	if baseTier >= 85 then
		tier = 0
	elseif baseTier >= 70 then
		tier = 1
	elseif baseTier >= 50 then
		tier = 2
	elseif baseTier >= 30 then
		tier = 3
	else
		tier = 4
	end
	
	--reset
	local secondaugment = 0
	local thirdaugment =0
	local randaugment1 = 0
	local randaugment2 = 0
	local randaugment3 = 0
	local aug1 = 0
	local aug2 = 0
	local aug3 = 0
	local multival1 = 0
	local multival2 = 0
	local multival3 = 0
	
	--Determine Base
	--local item1 = augdrops[math.random(1, #augdrops)]
	local item1 = player:getCharVar("Thingy")
	--Determine Augment 1
	
	local randaugment1 = math.random(1, #augs[item1].augments)
	local aug1 = augs[item1].augments[randaugment1]
	
	local multival1 = aug1.max / (5 - tier) 
	local multival1 = math.floor(multival1)
	
	local augment1 = aug1.aug
	
	--Determine Augment 2
	local secondaugment = math.random(1, 100)
	if secondaugment > 60 then
		local randaugment2 = math.random(1, #augs[item1].augments)
		
		if randaugment2 == randaugment1 then
			randaugment2 = 0
		end
		
		if randaugment2 ~= 0 then
			local aug2 = augs[item1].augments[randaugment2]
			local multival2 = aug2.max / (5 - tier) 
			local multival2 = math.floor(multival2)
			
			local augment2 = aug2.aug
		else
			local randaugment2 = 0
		end
	end
	
	--determine augment 3
	local thirdaugment = math.random(1, 100)
	
	if thirdaugment > 60 then
		local randaugment3 = math.random(1, #augs[item1].augments)
		
		if randaugment3 == randaugment1 then
			randaugment2 = 0
		end
		
		if randaugment3 == randaugment2 then
			randaugment3 = 0
		end
		
		if randaugment3 ~= 0 then
			local aug3 = augs[item1].augments[randaugment3]
			local multival3 = aug3.max / (5 - tier) 
			local multival3 = math.floor(multival3)
			
			local augment3 = aug3.aug
		else
			local randaugment3 = 0
		end
	end
	
	local testVar = aug1.max / (5 - tier) 
	local testVar = math.floor(testVar)
	
	player:addItem(item1, 1, augment1, multival1, augment2, multival2, augment3, multival3)
	player:messageSpecial(zones[player:getZone():getID()].text.ITEM_OBTAINED, item1)

end

local beginInvasion = function(player, npc)
    player:changeMusic(0, 247)
	player:changeMusic(1, 247)
	player:changeMusic(2, 247)
	player:changeMusic(3, 247)
	player:changeMusic(4, 247)
	
	local numToSpawn = 9 -- want 12 but can't get allies to work

    local invaderIds = {}
    for invaderId = islandID.mob.INVADER_OFFSET, islandID.mob.INVADER_OFFSET + numToSpawn - 1, 1 do
        table.insert(invaderIds, invaderId)
    end

    xi.confrontation.start(player, npc, invaderIds, function(playerArg)
		MakeItem(player, itemid, npc)
		player:changeMusic(0, 33)
		player:changeMusic(1, 33)
		player:changeMusic(2, 33)
		player:changeMusic(3, 33)
		player:changeMusic(4, 33)
		if tier == 3 then
			player:addItem(4074, 1)
		elseif tier == 4 then
			player:addItem(4075, 1)
		elseif tier == 5 then
			player:addItem(4076, 1)
		end
		player:setCharVar("Mission2State", 2)
		player:setCharVar("[Narf]time", getVanaMidnight())
    end)
end

m:addOverride("xi.zones.Abdhaljs_Isle-Purgonorgo.Zone.onInitialize", function(zone)

    super(zone)


	local Quasilumin = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Narf",
        look = '0x0000150400000000000000000000000000000000',
        x = 311,
        y = -3,
        z = 239,
        rotation = 0,
			
	onTrigger = function(player, npc)
		if player:getCharVar("Mission2State") == 3 then
			player:PrintToPlayer("You wish to once again contend against the old invaders eh?",0, npc:getPacketName())
			player:PrintToPlayer("Bring me more of that infamy and I can make it happen",13)
		elseif player:getCharVar("Mission2State") == 2 then
			player:PrintToPlayer("Well done ol' chap!, I say never have I seen a finer display.",0, npc:getPacketName())
			player:PrintToPlayer("The leader was Teodor... something odd about that one...",13)
			player:PrintToPlayer("And who is his master he refered to?",13)
			player:setCharVar("Mission2State", 3)
		elseif player:getCharVar("Mission2State") == 1 then
			player:PrintToPlayer("I can let you relive the last invsion...", 0, npc:getPacketName())
			player:PrintToPlayer("I just need 100 infamy and a shadow geode to do so.",13)
		elseif player:getCharVar("TimStuff") == 2 then
			player:PrintToPlayer("There was a point back when these people first came to this island that there were invasions...",0, npc:getPacketName())
			player:PrintToPlayer("I can let you relive one of those instances if you like...", 13)
			player:PrintToPlayer("I would need 100 of the local currency... Infamy I believe, and a shadow geode",13)
			player:setCharVar("Mission2State", 1)
		else
			player:PrintToPlayer("I am a pretty light, oh how I sparkle, oh how I shiiiiiiiine..." ,0, npc:getPacketName())
		end
	end,
	
	onTrade = function(player, npc, trade)
		if player:getCharVar("Mission2State") >= 0 then
			
			if trade:hasItemQty(26791, 1) then -- Eschite Helm
				player:setCharVar("Thingy", 26791)
			elseif trade:hasItemQty(26792, 1) then -- Despair Helm
				player:setCharVar("Thingy", 26792)
			elseif trade:hasItemQty(26793, 1) then -- Naga Somen
				player:setCharVar("Thingy", 26793)
			elseif trade:hasItemQty(26794, 1) then -- Rawhide Mask
				player:setCharVar("Thingy", 26794)
			elseif trade:hasItemQty(26795, 1) then -- Pursuers Beret
				player:setCharVar("Thingy", 26795)
			elseif trade:hasItemQty(26796, 1) then -- Psycloth Tiara
				player:setCharVar("Thingy", 26796)
			elseif trade:hasItemQty(26797, 1) then -- Vanya Hood
				player:setCharVar("Thingy", 26797)
			elseif trade:hasItemQty(26947, 1) then -- Eschite Breastplate
				player:setCharVar("Thingy", 26947)
			elseif trade:hasItemQty(26948, 1) then -- Despair Mail 
				player:setCharVar("Thingy", 26948)
			elseif trade:hasItemQty(26949, 1) then -- Naga Samue
				player:setCharVar("Thingy", 26949)
			elseif trade:hasItemQty(26950, 1) then -- Rawhide Vest
				player:setCharVar("Thingy", 26950)
			elseif trade:hasItemQty(26951, 1) then -- Pursuers Doublet
				player:setCharVar("Thingy", 26951)
			elseif trade:hasItemQty(26952, 1) then -- Psycloth Vest
				player:setCharVar("Thingy", 26952)
			elseif trade:hasItemQty(26953, 1) then -- Vanya Robe
				player:setCharVar("Thingy", 26953)
			elseif trade:hasItemQty(27097, 1) then -- Eschite Gauntlets
				player:setCharVar("Thingy", 27097)
			elseif trade:hasItemQty(27098, 1) then -- Despair Finger Gauntlets 
				player:setCharVar("Thingy", 27098)
			elseif trade:hasItemQty(27099, 1) then -- Naga Tekko
				player:setCharVar("Thingy", 27099)
			elseif trade:hasItemQty(27100, 1) then -- Rawhide Gloves
				player:setCharVar("Thingy", 27100)
			elseif trade:hasItemQty(27101, 1) then -- Pursuers Cuffs
				player:setCharVar("Thingy", 27101)
			elseif trade:hasItemQty(27102, 1) then -- Psycloth Manillas
				player:setCharVar("Thingy", 27102)
			elseif trade:hasItemQty(27103, 1) then -- Vanya Cuffs
				player:setCharVar("Thingy", 27103)
			elseif trade:hasItemQty(27282, 1) then -- Eschite Cuisses
				player:setCharVar("Thingy", 27282)
			elseif trade:hasItemQty(27283, 1) then -- Despair Cuisses 
				player:setCharVar("Thingy", 27283)
			elseif trade:hasItemQty(27284, 1) then -- Naga Hakama
				player:setCharVar("Thingy", 27284)
			elseif trade:hasItemQty(27285, 1) then -- Rawhide Trousers
				player:setCharVar("Thingy", 27285)
			elseif trade:hasItemQty(27286, 1) then -- Pursuers Pants
				player:setCharVar("Thingy", 27286)
			elseif trade:hasItemQty(27287, 1) then -- Psycloth Lappas
				player:setCharVar("Thingy", 27287)
			elseif trade:hasItemQty(27288, 1) then -- Vanya Slops
				player:setCharVar("Thingy", 27288)
			elseif trade:hasItemQty(27457, 1) then -- Eschite Greaves
				player:setCharVar("Thingy", 27457)
			elseif trade:hasItemQty(27458, 1) then -- Despair Greaves 
				player:setCharVar("Thingy", 27458)
			elseif trade:hasItemQty(27459, 1) then -- Naga Kyahan
				player:setCharVar("Thingy", 27459)
			elseif trade:hasItemQty(27460, 1) then -- Rawhide Boots
				player:setCharVar("Thingy", 27460)
			elseif trade:hasItemQty(27461, 1) then -- Pursuers Gaiters
				player:setCharVar("Thingy", 27461)
			elseif trade:hasItemQty(27462, 1) then -- Psycloth Boots
				player:setCharVar("Thingy", 27462)
			elseif trade:hasItemQty(27463, 1) then -- Vanya Clogs
				player:setCharVar("Thingy", 27463)
			end
				if os.time() > player:getCharVar("[Narf]time") and player:getCharVar("Thingy") ~= 1 then
					local MenuOpen = 1	
					local menu =
					{
						title = "Ready?",
						onStart = function(playerArg)
					
						playerArg:PrintToPlayer("Relive the memory?", xi.msg.channel.NS_SAY)
						end,
					options =
					{
						{
							"Not yet",
							function(playerArg)
							player:PrintToPlayer("Narf: Sometimes it is best to focus on now, not then.", xi.msg.channel.NS_SAY)
							player:PrintToPlayer("It... is now right? Not then? Or is now later? Eitehr way, I am here should you change your mind", xi.msg.channel.NS_SAY)
							end,
						},
						{
							"Begin, cost 100 infamy",
							function(playerArg)
								if player:getCurrency("infamy") >= 99 then
									player:tradeComplete()
									player:delCurrency("infamy", 100)
									beginInvasion(player, npc)
								else
									player:PrintToPlayer("Narf: Sorry, without the right amount of energy imbued infamy I cannot do this.", 13)
								end
							end,
						},

					},
					onCancelled = function(playerArg)
						local MenuOpen = 0
					end,
					onEnd = function(playerArg)
						local MenuOpen = 0
					end,
					}
					
					player:customMenu(menu)
					
				else
					player:PrintToPlayer("I will need to wait until tomorrow to be able to redo the conjuring...",0, npc:getPacketName())
				end
			
		end
	end,

})

	utils.unused(Quasilumin)	
	
end)

return m
