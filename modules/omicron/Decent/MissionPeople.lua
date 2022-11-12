-----------------------------------
-- Gatekeeper, teleporter and random filler NPCs
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Abdhaljs_Isle-Purgonorgo/Zone")
-----------------------------------
local m = Module:new("FlavourPeople")
m:setEnabled(true)

m:addOverride("xi.zones.Abdhaljs_Isle-Purgonorgo.Zone.onInitialize", function(zone)

    super(zone)
	
	local Dorry = zone:insertDynamicEntity({

        objtype = xi.objType.NPC,
        name = "Dorry",
        look = 100,
        x = 578.000,
        y = -2.100,
        z = 70.000,
        rotation = 128,
		
		onTrigger = function(player, npc)
			FoodMe = player:getCharVar("Mission1AState")
			if FoodMe == 0 then
				player:PrintToPlayer("So you're new around here, well bully for you..." ,0, npc:getPacketName())
				player:PrintToPlayer("Oh... you want to help us? Alright, well what we mainly need is food..." , 13)
				player:PrintToPlayer("What we need first is 4 full stacks of lizard eggs, bring me that and I'll let you know if there is more needed." , 13)
				player:setCharVar("Mission1AState", 1)
			elseif FoodMe == 1 then
				player:PrintToPlayer("Please bring me 4 full stacks of lizard eggs, afterwords I'll let you know if there is more needed." ,0, npc:getPacketName())
			elseif FoodMe == 2 then
				player:PrintToPlayer("Please bring me 2 full stacks of San D'Orian flour, we'll need more things after that." ,0, npc:getPacketName())
			elseif FoodMe == 3 then
				player:PrintToPlayer("Please bring me a full stack of Selbina milk." ,0, npc:getPacketName())
			elseif FoodMe == 4 then
				player:PrintToPlayer("Thank you for your help it has been greatly appreciated" ,0, npc:getPacketName())
				player:PrintToPlayer("Feel free to bring more lizard eggs, flour, or milk. Please one stack at a time if you do." ,13)
				player:PrintToPlayer("I'll even be able to pay you." ,13)
			end
		end,

		onTrade = function(player, npc, trade)
			FoodMe = player:getCharVar("Mission1AState")
			if FoodMe == 1 then
				if (trade:hasItemQty(4362, 48)) then
					player:tradeComplete();
					player:PrintToPlayer("Thank you, this will greatly help the other survivors." ,0, npc:getPacketName())
					player:PrintToPlayer("Next we'll need 2 full stacks of San D'Orian flour." , 13)
					player:setCharVar("Mission1AState", 2)
				else
					player:PrintToPlayer("Thats not what we need, we need lizard eggs, total of 48 of them please in one shipment." ,0, npc:getPacketName())
				end
			elseif FoodMe == 2 then
				if (trade:hasItemQty(610, 24)) then
					player:tradeComplete();
					player:PrintToPlayer("Thank you, this will greatly help the other survivors." ,0, npc:getPacketName())
					player:PrintToPlayer("Next we'll need a full stacks of Selbina Milk." , 13)
					player:setCharVar("Mission1AState", 3)
				else
					player:PrintToPlayer("Thats not what we need, we need San D'Orian flour, total of 24 bags please in one shipment." ,0, npc:getPacketName())
				end
			elseif FoodMe == 3 then
				if (trade:hasItemQty(4378, 12)) then
					player:tradeComplete();
					player:PrintToPlayer("Thank you, this will greatly help the other survivors." ,0, npc:getPacketName())
					player:PrintToPlayer("We'll be able to make a fair amount of rationable food with what you brought." , 13)
					player:PrintToPlayer("Please take this for your troubles." , 13)
					player:PrintToPlayer("You recieve 20 Infamy", 29)
					player:addCurrency('infamy', 20)
					player:setCharVar("Mission1AState", 4)
					quest:complete(player)
				else
					player:PrintToPlayer("Thats not what we need, we need Selbina milk, total of 12 bottles please in one shipment." ,0, npc:getPacketName())
				end
			elseif FoodMe == 4 then
				if (trade:hasItemQty(4362, 12)) or
					(trade:hasItemQty(610, 12)) or
					(trade:hasItemQty(4378, 12)) 
				then
					player:tradeComplete();
					player:PrintToPlayer("Please take this for your troubles." ,0, npc:getPacketName())
					player:addCurrency('infamy', 10)
					quest:complete(player)
					player:PrintToPlayer("You recieve 10 Infamy", 29)
				else
					player:PrintToPlayer("Sorry I'm not in need of anything at this time" ,0, npc:getPacketName())
				end
			else
				player:PrintToPlayer("Sorry I'm not in need of anything at this time" ,0, npc:getPacketName())
			end
		end,
		
    })

	utils.unused(Dorry)		

---------------------------------------

local Borry = zone:insertDynamicEntity({

	objtype = xi.objType.NPC,
    name = "Borry",
    look = 101,
    x = 573.000,
    y = -2.100,
    z = 70.000,
    rotation = 128,
		
		onTrigger = function(player, npc)
			OreMe = player:getCharVar("Mission1BState")
			if OreMe == 0 then
				player:PrintToPlayer("Well fancy yourself a helper eh?" ,0, npc:getPacketName())
				player:PrintToPlayer("In that case how about bringing us some iron ore so we can make some weapons and tools" , 13)
				player:PrintToPlayer("Probably about 48 hefty chunks will do." , 13)
				player:setCharVar("Mission1BState", 1)
			elseif OreMe == 1 then
				player:PrintToPlayer("We need 4 full stacks of iron." ,0, npc:getPacketName())
			elseif OreMe == 2 then
				player:PrintToPlayer("Please bring me 4 full stacks of copper ore, we'll need more things after that." ,0, npc:getPacketName())
			elseif OreMe == 3 then
				player:PrintToPlayer("Please bring me a full stack of zinc." ,0, npc:getPacketName())
			elseif OreMe == 4 then
				player:PrintToPlayer("Thank you for your help it has been greatly appreciated")
				player:PrintToPlayer("Feel free to bring more iron, copper, or zinc ore, but just one stack at a time please." ,13)
				player:PrintToPlayer("Don't worry I can pay." ,13)
			end
		end,
		
		onTrade = function(player, npc, trade)
			OreMe = player:getCharVar("Mission1BState")
			if OreMe == 1 then
				if (trade:hasItemQty(643, 48)) then
					player:tradeComplete();
					player:PrintToPlayer("Thank you, this will will help us stab those blooming creepers out there." ,0, npc:getPacketName())
					player:PrintToPlayer("Next we'll need 48 chunks of copper ore." , 13)
					player:setCharVar("Mission1BState", 2)
				else
					player:PrintToPlayer("I said we needed 48 chunks of iron ore." ,0, npc:getPacketName())
				end
			elseif OreMe == 2 then
				if (trade:hasItemQty(640, 48)) then
					player:tradeComplete();
					player:PrintToPlayer("This will help keep those buggers from killing us." ,0, npc:getPacketName())
					player:PrintToPlayer("Next we'll need about 12 pieces of zinc." , 13)
					player:setCharVar("Mission1BState", 3)
				else
					player:PrintToPlayer("No, no, no, it was 48 pieces of copper ore." ,0, npc:getPacketName())
				end
			elseif OreMe == 3 then
				if (trade:hasItemQty(642, 12)) then
					player:tradeComplete();
					player:PrintToPlayer("Thank you, this will greatly help the other survivors." ,0, npc:getPacketName())
					player:PrintToPlayer("With all this we can finally defend ourselves once its crafted together." , 13)
					player:PrintToPlayer("Norry might have something for you to do." , 13)
					player:PrintToPlayer("You recieve 20 Infamy", 29)
					player:addCurrency('infamy', 20)
					player:setCharVar("Mission1BState", 4)
					quest:complete(player)
				else
					player:PrintToPlayer("We needed 12 pieces of zinc ore, here take this back." ,0, npc:getPacketName())
				end
			elseif OreMe == 4 then
				if (trade:hasItemQty(643, 12)) or
					(trade:hasItemQty(640, 12)) or
					(trade:hasItemQty(642, 12))
				then
					player:tradeComplete();
					player:PrintToPlayer("Thank you, this will greatly help the other survivors." ,0, npc:getPacketName())
					player:addCurrency('infamy', 10)
					quest:complete(player)
					player:PrintToPlayer("You recieve 10 Infamy", 29)
				else
					player:PrintToPlayer("Thanks, but no thank you" ,0, npc:getPacketName())
				end
			else
				player:PrintToPlayer("Sorry I'm not in need of anything at this time" ,0, npc:getPacketName())
			end
		end,

    })

	utils.unused(Borry)		

---------------------------------------

local Norry = zone:insertDynamicEntity({

	objtype = xi.objType.NPC,
    name = "Norry",
    look = 102,
    x = 573.000,
    y = -2.100,
    z = 70.000,
    rotation = 128,
		
		onTrigger = function(player, npc)
			BigFight1 = player:getCharVar("Mission1CState")
			FoodMe = player:getCharVar("Mission1AState")
			OreMe =	player:getCharVar("Mission1BState")
			if BigFight1 == 0 and
				FoodMe == 4 and
				OreMe == 4
			then
				if BigFight1 == 0 then
					player:PrintToPlayer("I hear your from another world... I guess you may be able to help" ,0, npc:getPacketName())
					player:PrintToPlayer("Me and my brothers here are trying to find ways to stop or slow these hordes of creatures" , 13)
					player:timer(1000, function(player)
						player:PrintToPlayer("All I can say is its been a losing battle." ,0, npc:getPacketName())
						player:PrintToPlayer("Well with that said, Mid over by the big thing was able to confine some of the nastier ones." , 13)
						player:PrintToPlayer("Now this is where you come in..." ,13)
					end)
					player:timer(3000, function(player)
						player:PrintToPlayer("Back at the pier is a vortex, its the Naakual trying to break free." ,0, npc:getPacketName())
						player:PrintToPlayer("You'll need to gather this odd currency the locals have calling infamy..." , 13)
						player:PrintToPlayer("Odd name I know... anyways it holds an odd energy to it that reacts to the vortices." , 13)
					end)
					player:timer(5000, function(player)
						player:PrintToPlayer("If you get about 100 of this stuff you should be able to temporarily bring out a Naakual.",0,npc:getPacketName())
						player:PrintToPlayer("If you can, bring me the stinger from the one by the insects." , 13)
						player:setCharVar("Mission1CState", 1)
					end)
				elseif BigFight1 == 1 then
					player:PrintToPlayer("I'm looking for the stinger from the insect Naakual if you can." ,0, npc:getPacketName())
				elseif BigFight1 == 2 then
					player:PrintToPlayer("Thank you again for your help." ,0, npc:getPacketName())
				end
			elseif BigFight1 == 0 and
				FoodMe ~= 4 and
				OreMe ~= 4
			then
				player:PrintToPlayer("Sorry, I'm fairly busy at the moment, maybe my brothers can help you." ,0, npc:getPacketName())
			end
		end,
		
		onTrade = function(player, npc, trade)
			FoodMe = player:getCharVar("Mission1CState")
			if BigFight1 == 1 then
				if (trade:hasItemQty(3980, 1)) then
					player:tradeComplete();
					player:PrintToPlayer("Thank you, with this I may be able to find something that could help us in the fight." ,0, npc:getPacketName())
					player:PrintToPlayer("At the very least some other medicines may come from this who knows." , 13)
					player:addCurrency('infamy', 20)
					player:addItem(13454, 1, 137, 4, 353, 1, 138, 4, 142, 9)
					player:PrintToPlayer("You recieve 20 Infamy, and an augmented copper ring", 29)
					player:setCharVar("Mission1CState", 2)
					quest:complete(player)
				else
					player:PrintToPlayer("Sorry that wasn't what I asked for." ,0, npc:getPacketName())
				end
			elseif BigFight1 == 2 then
				if (trade:hasItemQty(3980, 1)) then
					player:tradeComplete();
					player:PrintToPlayer("You... killed... more?." ,0, npc:getPacketName())
					player:PrintToPlayer("All I have at this time is some more Infamy to give, along with my thanks." , 13)
					player:addCurrency('infamy', 10)
					quest:complete(player)
					player:PrintToPlayer("You recieve 10 Infamy", 29)
				else
					player:PrintToPlayer("Sorry I'm not in need of anything at this time" ,0, npc:getPacketName())
				end
			else
				player:PrintToPlayer("Sorry I'm not in need of anything at this time" ,0, npc:getPacketName())
			end
		end,

    })

	utils.unused(Norry)
		
end)

return m
