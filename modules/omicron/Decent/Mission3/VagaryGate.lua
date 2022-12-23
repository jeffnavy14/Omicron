-----------------------------------
-- NPC: GateWay
-- for mission 2-1 of Decent
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Abdhaljs_Isle-Purgonorgo/Zone")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
-----------------------------------
local m = Module:new("VagaryGate")
m:setEnabled(true)

m:addOverride("xi.zones.Abdhaljs_Isle-Purgonorgo.Zone.onInitialize", function(zone)

    super(zone)
	
local Tim = zone:insertDynamicEntity({

    objtype = xi.objType.NPC,
    name = " ",
    look = 2941,
    x = 600,
    y = -3,
    z = 220,
	
	onTrade = function(player, npc, trade)
		if (trade:hasItemQty(9008,1)) and (player:getCharVar("Mission3State") >= 5) then
			
			local party = player:getParty()
			
			local MenuOpen = 1	
			local menu =
			{
				title = "Into the mists?",
				onStart = function(playerArg)
			
				end,
			options =
			{
				{
					"Not yet",
					function(playerArg)
					end,
				},
				{
					"Proceed",
					function(playerArg)
						if party ~= nil then
							for i, v in pairs(party) do
								if not (v:getCharVar("Mission3State") >= 5) and (v:getMainLvl() >= 99) then
									player:PrintToPlayer("One or more members do not meet the requirements.", 13)
									return
								end
							end
							player:setPos(0,0,4,65,275)
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
			
			player:timer(50, function(playerArg)
				playerArg:customMenu(menu)
			end)
		else
			player:PrintToPlayer("Nothing happens...", 13)
		end
	
	end,



    })
    utils.unused(VagaryGate)
end)

return m