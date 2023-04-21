-----------------------------------
-- Island Reive Quest Giver and Spawners
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Abdhaljs_Isle-Purgonorgo/Zone")
require('scripts/globals/npc_util')
require("scripts/globals/alitems")
-----------------------------------

local m = Module:new("IslandReive")
m:setEnabled(true)

local islandID = require("scripts/zones/Abdhaljs_Isle-Purgonorgo/IDs")

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
		local Reward = player:getCharVar("InvReward")
		player:addTreasure(Reward)
		player:setCharVar("InvReward", 0)
		player:changeMusic(0, 33)
		player:changeMusic(1, 33)
		player:changeMusic(2, 33)
		player:changeMusic(3, 33)
		player:changeMusic(4, 33)
        local tier = math.random(1, 5)
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
			if player:getCharVar("Mission2FirstClear") == 0 then
				player:PrintToPlayer("Congratulations on completing chapter 2 of Abyssean Decent.", 29)
				player:injectActionPacket(player:getID(), 6, 702, 0, 0, 0, 10, 1)
				player:setCharVar("Mission2FirstClear", 1)
			end
		elseif player:getCharVar("Mission2State") == 1 then
			player:PrintToPlayer("I can let you relive the last invsion...", 0, npc:getPacketName())
			player:PrintToPlayer("I just need 100 infamy and some Eschalixers", 13)
			player:PrintToPlayer("Of the regular, 5. Of the Higher quality, 40. You will get an improved quality upon completion.", 13)
		elseif player:getCharVar("TimStuff") == 2 then
			player:PrintToPlayer("There was a point back when these people first came to this island that there were invasions...",0, npc:getPacketName())
			player:PrintToPlayer("I can let you relive one of those instances if you like...", 13)
			player:PrintToPlayer("I would need 100 of the local currency... Infamy I believe, and some Eschalixers", 13)
			player:PrintToPlayer("Of the regular, 5. Of the Higher quality, 40. You will get an improved quality upon completion.", 13)
			player:setCharVar("Mission2State", 1)
			player:setCharVar("Mission2FirstClear", 0)
		else
			player:PrintToPlayer("I am a pretty light, oh how I sparkle, oh how I shiiiiiiiine..." ,0, npc:getPacketName())
		end
	end,
	
	onTrade = function(player, npc, trade)
		if player:getCharVar("Mission2State") >= 0 then
			
			if trade:hasItemQty(9084, 5) then -- Eschalixer (10rp per)
				player:setCharVar("InvReward", 9085) -- Eschalixer +1 (50rp per)
				player:setLocalVar("InvTier", 0)
			elseif trade:hasItemQty(9085, 3) then -- Eschalixer +1 (50rp per, amount needed reduced to reduce time sink)
				player:setCharVar("InvReward", 9086) -- Eschalixer +2 (2000rp per)
				player:setLocalVar("InvTier", 1)
			end
				if os.time() > player:getCharVar("[Narf]time") and player:getCharVar("InvReward") ~= 0 then
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
