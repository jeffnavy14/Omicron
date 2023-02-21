-----------------------------------
-- NPC: Choose Path and Initiate
-- for mission 3-1 of Decent
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Outer_RaKaznar_[U1]/Zone")
require("scripts/globals/npc_util")
require("scripts/globals/utils")
-----------------------------------

local m = Module:new("PathChoice")
m:setEnabled(true)

local PathTele = function(player, npc, actionId, animationId, speceffect, reaction, message)
	if
		player:getCharVar("VagPathActive") == 1
	then
		player:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
		player:timer(2000, function(player)
			player:setPos(-460,-140,38,190)
		end)
	elseif
		player:getCharVar("VagPathActive") == 2
	then
		player:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
		player:timer(2000, function(player)
			player:setPos(-399,-160,-180,63)
		end)
	elseif
		player:getCharVar("VagPathActive") == 3
	then
		player:injectActionPacket(player:getID(), 6, 617, 0, 0, 0, 10, 1)
		player:timer(2000, function(player)
			partyMember:setPos(-540,-155,100,190)
		end)
	end
end

m:addOverride("xi.zones.Outer_RaKaznar_[U1].Zone.onInitialize", function(zone)

SetServerVariable("Vag1Active", 0)
SetServerVariable("P1W1Kills", 0)
SetServerVariable("P1W2Kills", 0)
SetServerVariable("P1W3Kills", 0)
SetServerVariable("P1Boss1", 0)
SetServerVariable("P1Boss2", 0)
SetServerVariable("P1Boss3", 0)

SetServerVariable("Vag2Active", 0)
SetServerVariable("P2Kills", 0)
SetServerVariable("P2Boss1", 0)
SetServerVariable("P2Boss2", 0)
SetServerVariable("P2Boss3", 0)

SetServerVariable("Vag3Active", 0)
SetServerVariable("P3Boss2", 0)

local Path1 = function(player, npc)
	SetServerVariable("Vag1Active", 1)
	SetServerVariable("P1W1Kills", 0)
	SetServerVariable("P1W2Kills", 0)
	SetServerVariable("P1W3Kills", 0)
	SetServerVariable("P1Boss1", 0)
	SetServerVariable("P1Boss2", 0)
	GetNPCByID(17904626):setStatus(xi.status.INVISIBLE)
	local p1ID = 17903617
	repeat
		SpawnMob(p1ID)
		p1ID = p1ID + 1
	until p1ID == 17903647
	GetNPCByID(17904623):setStatus(xi.status.NORMAL)
	GetNPCByID(17904623):renameEntity("Connection")
	local secret = math.random(1, 10)
	
	player:setCharVar("VagPathActive", 1)
	npc:timer(3600000, function(player, mob, npc)
		SetServerVariable("Vag1Active", 0)
	end)
	player:timer(1800000, function(player)
		player:PrintToPlayer("30 minutes remaining", 13)
	end)
	player:timer(3300000, function(player, mob, npc)
		player:PrintToPlayer("5 minutes left before the befouled water effects wear off.", 13)
	end)
	player:timer(3540000, function(player, mob, npc)
		player:PrintToPlayer("1 minute remains before the befouled water effects wear off.", 13)
	end)
	player:timer(3600000, function(player, mob, npc)
		SetServerVariable("Vag1Active", 0)
		if player:getCharVar("VagPathActive", 1) then
			player:setPos(0,0,0)
			player:changeMusic(0, 73)
			player:changeMusic(1, 73)
			player:changeMusic(2, 73)
			player:changeMusic(3, 73)
			player:changeMusic(4, 73)
			player:setCharVar("VagPathActive", 0)
			player:PrintToPlayer("The effects of the befouled water have expired", 13)
		end
	end)
end

local Path2 = function(player, npc)
	SetServerVariable("Vag2Active", 1)
	SetServerVariable("P2Kills", 0)
	SetServerVariable("P2Boss1", 0)
	SetServerVariable("P2Boss2", 0)
	SetServerVariable("P2Boss3", 0)
	player:setCharVar("VagPathActive", 2)
	GetNPCByID(17904617):setStatus(xi.status.NORMAL)
	GetNPCByID(17904618):setStatus(xi.status.NORMAL)
	GetNPCByID(17904619):setStatus(xi.status.NORMAL)
	GetNPCByID(17904620):setStatus(xi.status.NORMAL)
	GetNPCByID(17904621):setStatus(xi.status.NORMAL)
	GetNPCByID(17904622):setStatus(xi.status.NORMAL)
	GetNPCByID(17904617):renameEntity("Pillar")
	GetNPCByID(17904618):renameEntity("Pillar")
	GetNPCByID(17904619):renameEntity("Pillar")
	GetNPCByID(17904620):renameEntity("Pillar")
	GetNPCByID(17904621):renameEntity("Pillar")
	GetNPCByID(17904622):renameEntity("Pillar")
	GetNPCByID(17904624):setStatus(xi.status.NORMAL)
	GetNPCByID(17904624):renameEntity("Connection")
	
	npc:timer(3600000, function(player, mob, npc)
		SetServerVariable("Vag2Active", 0)
	end)
	player:timer(1800000, function(player)
		player:PrintToPlayer("30 minutes remaining", 13)
	end)
	player:timer(3300000, function(player, mob, npc)
		player:PrintToPlayer("5 minutes left before the befouled water effects wear off.", 13)
	end)
	player:timer(3540000, function(player, mob, npc)
		player:PrintToPlayer("1 minute remains before the befouled water effects wear off.", 13)
	end)
	player:timer(3600000, function(player, mob, npc)
		SetServerVariable("Vag1Active", 0)
		player:setPos(0,0,0)
		player:changeMusic(0, 73)
		player:changeMusic(1, 73)
		player:changeMusic(2, 73)
		player:changeMusic(3, 73)
		player:changeMusic(4, 73)
		GetNPCByID(17904617):setStatus(xi.status.INVISIBLE)
		GetNPCByID(17904618):setStatus(xi.status.INVISIBLE)
		GetNPCByID(17904619):setStatus(xi.status.INVISIBLE)
		GetNPCByID(17904620):setStatus(xi.status.INVISIBLE)
		GetNPCByID(17904621):setStatus(xi.status.INVISIBLE)
		GetNPCByID(17904622):setStatus(xi.status.INVISIBLE)
		if player:getCharVar("VagPathActive", 2) then
			player:setPos(0,0,0)
			player:changeMusic(0, 65)
			player:changeMusic(1, 65)
			player:changeMusic(2, 65)
			player:changeMusic(3, 65)
			player:changeMusic(4, 65)
			player:setCharVar("VagPathActive", 0)
			player:PrintToPlayer("The effects of the befouled water have expired", 13)
		end
	end)
end

local Path3 = function(player, npc)
	SetServerVariable("Vag3Active", 1)
	player:setCharVar("VagPathActive", 3)
	SetServerVariable("P3W1Kills", 0)
	SetServerVariable("P3W2Kills", 0)
	SetServerVariable("P3W2Kills", 0)
	SetServerVariable("P3W3Kills", 0)
	SetServerVariable("P3W4Kills", 0)
	SetServerVariable("P3Wave1", 1)
	SetServerVariable("P3Boss1", 0)
	SetServerVariable("P3Wave3", 0)
	SetServerVariable("P3Wave4", 0)
	local p1ID = 17903769
	repeat
		SpawnMob(p1ID)
		p1ID = p1ID + 1
	until p1ID == 17903795
	GetNPCByID(17904625):setStatus(xi.status.NORMAL)
	GetNPCByID(17904625):renameEntity("Connection")
	
	player:setCharVar("VagPathActive", 3)
	npc:timer(3600000, function(player, mob, npc)
		SetServerVariable("Vag3Active", 0)
	end)
	player:timer(1800000, function(player)
		player:PrintToPlayer("30 minutes remaining", 13)
	end)
	player:timer(3300000, function(player, mob, npc)
		player:PrintToPlayer("5 minutes left before the befouled water effects wear off.", 13)
	end)
	player:timer(3540000, function(player, mob, npc)
		player:PrintToPlayer("1 minute remains before the befouled water effects wear off.", 13)
	end)
	player:timer(3600000, function(player, mob, npc)
		SetServerVariable("Vag3Active", 0)
		if player:getCharVar("VagPathActive", 3) then
			player:setPos(0,0,0)
			player:changeMusic(0, 73)
			player:changeMusic(1, 73)
			player:changeMusic(2, 73)
			player:changeMusic(3, 73)
			player:changeMusic(4, 73)
			player:setCharVar("VagPathActive", 0)
			player:PrintToPlayer("The effects of the befouled water have expired", 13)
		end
	end)
end

    super(zone)
	
local VagaryGate = zone:insertDynamicEntity({

    objtype = xi.objType.NPC,
    name = " ",
    look = 2857,
    x = 0,
    y = 0,
    z = -3,
	
	onTrade = function(player, npc, trade)
		if (trade:hasItemQty(9008,1)) and (player:getCharVar("Mission3State") >= 5) then
			if GetServerVariable("Vag1Active") == 0 and (player:getCharVar("VagPathActive") == 1) then
				player:setCharVar("VagPathActive", 0)
			elseif GetServerVariable("Vag2Active") == 0 and (player:getCharVar("VagPathActive") == 2) then
				player:setCharVar("VagPathActive", 0)
			elseif GetServerVariable("Vag3Active") == 0 and (player:getCharVar("VagPathActive") == 3) then
				player:setCharVar("VagPathActive", 0)
			elseif GetServerVariable("Vag1Active") == 1 and (player:getCharVar("VagPathActive") == 1) then
				player:PrintToPlayer("You have an active path already.", 13)
			elseif GetServerVariable("Vag2Active") == 1  and (player:getCharVar("VagPathActive") == 2) then
				player:PrintToPlayer("You have an active path already.", 13)
			elseif GetServerVariable("Vag3Active") == 1  and (player:getCharVar("VagPathActive") == 3) then
				player:PrintToPlayer("You have an active path already.", 13)
			else
			
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
						"Path 1",
						function(playerArg)
							if party ~= nil then
								for i, v in pairs(player:getParty()) do
									if not (v:getCharVar("Mission3State") >= 5) then
										player:PrintToPlayer("One or more members do not meet the requirements.", 13)
										return
									end
								end
								if (GetServerVariable("Vag1Active") ~= 1) then
									for i, partyMember in pairs(party) do
										if partyMember:isPC() then
											partyMember:setCharVar("VagPathActive", 1)
											--partyMember:setPos(-460,-140,38,190)
											partyMember:changeMusic(0, 62)
											partyMember:changeMusic(1, 62)
											partyMember:changeMusic(2, 62)
											partyMember:changeMusic(3, 62)
											partyMember:changeMusic(4, 62)
											PathTele(player, npc, actionId, animationId, speceffect, reaction, message) -- new tele method
											local secret = math.random(1, 10)
											if (player:getCharVar("VagPath3Win") == 1) and (secret > 6) then
												SpawnMob(17903708)
												partyMember:changeMusic(0, 65)
												partyMember:changeMusic(1, 65)
												partyMember:changeMusic(2, 65)
												partyMember:changeMusic(3, 65)
												partyMember:changeMusic(4, 65)
											end
										end
									end
									Path1(player, npc)
									player:tradeComplete()
								else
									player:PrintToPlayer("The path cannot be traveled at this time...", 13)
								end
							end
							
						end,
					},
					
					{
						"Path 2",
						function(playerArg)
							if party ~= nil then
								for i, v in pairs(player:getParty()) do
									if not (v:getCharVar("VagPath1Win") >= 1) then
										player:PrintToPlayer("One or more members do not meet the requirements.", 13)
										return
									end
								end
								if (GetServerVariable("Vag2Active") ~= 1) then
									for i, partyMember in pairs(party) do
										if partyMember:isPC() then
											partyMember:setCharVar("VagPathActive", 2)
											--partyMember:setPos(-399,-160,-180,63)
											partyMember:changeMusic(0, 62)
											partyMember:changeMusic(1, 62)
											partyMember:changeMusic(2, 62)
											partyMember:changeMusic(3, 62)
											partyMember:changeMusic(4, 62)
											PathTele(player, npc, actionId, animationId, speceffect, reaction, message) -- new tele method
											local secret = math.random(1, 10)
											if (player:getCharVar("VagPath3Win") == 1) and (secret > 6) then
												SpawnMob(17903767)
												partyMember:changeMusic(0, 65)
												partyMember:changeMusic(1, 65)
												partyMember:changeMusic(2, 65)
												partyMember:changeMusic(3, 65)
												partyMember:changeMusic(4, 65)
											end
										end
									end
									Path2(player, npc)
									player:tradeComplete()
								else
									player:PrintToPlayer("The path cannot be traveled at this time...", 13)
								end
							end
						end,
					},
					
					{
						"Path 3",
						function(playerArg)
							if party ~= nil then
								for i, v in pairs(player:getParty()) do
									if not (v:getCharVar("VagPath2Win") >= 1) then
										player:PrintToPlayer("One or more members do not meet the requirements.", 13)
										return
									end
								end
								if (GetServerVariable("Vag3Active") ~= 1) then
									for i, partyMember in pairs(party) do
										if partyMember:isPC() then
											partyMember:setCharVar("VagPathActive", 3)
											--partyMember:setPos(-540,-155,100,190)
											partyMember:changeMusic(0, 62)
											partyMember:changeMusic(1, 62)
											partyMember:changeMusic(2, 62)
											partyMember:changeMusic(3, 62)
											partyMember:changeMusic(4, 62)
											PathTele(player, npc, actionId, animationId, speceffect, reaction, message) -- new tele method
											local secret = math.random(1, 10)
											if (player:getCharVar("VagPath3Win") == 1) and (secret > 6) then
												SpawnMob(17903824)
												partyMember:changeMusic(0, 65)
												partyMember:changeMusic(1, 65)
												partyMember:changeMusic(2, 65)
												partyMember:changeMusic(3, 65)
												partyMember:changeMusic(4, 65)
											end
										end
									end
									Path3(player, npc)
									player:tradeComplete()
								else
									player:PrintToPlayer("The path cannot be traveled at this time...", 13)
								end
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
			
			end
		end
	end,

	onTrigger = function(player, npc, status)
		if (GetServerVariable("Vag1Active") == 1) and (player:getCharVar("VagPathActive") == 1) then
			--player:setPos(-460,-140,38,190)
			PathTele(player, npc, actionId, animationId, speceffect, reaction, message) -- new tele method
			player:changeMusic(0, 62)
			player:changeMusic(1, 62)
			player:changeMusic(2, 62)
			player:changeMusic(3, 62)
			player:changeMusic(4, 62)
			player:PrintToPlayer("The mysterious energies leave your body, you feel you may enter again...", 13)
		elseif (GetServerVariable("Vag2Active") == 1) and (player:getCharVar("VagPathActive") == 2) then
			--player:setPos(-399,-160,-180,63)
			PathTele(player, npc, actionId, animationId, speceffect, reaction, message) -- new tele method
			player:changeMusic(0, 62)
			player:changeMusic(1, 62)
			player:changeMusic(2, 62)
			player:changeMusic(3, 62)
			player:PrintToPlayer("The mysterious energies leave your body, you feel you may enter again...", 13)
		elseif (GetServerVariable("VagActive") == 1) and (player:getCharVar("VagPathActive") == 3) then
			--player:setPos(-540,-155,100,190)
			PathTele(player, npc, actionId, animationId, speceffect, reaction, message) -- new tele method
			player:changeMusic(0, 62)
			player:changeMusic(1, 62)
			player:changeMusic(2, 62)
			player:changeMusic(3, 62)
			player:PrintToPlayer("The mysterious energies leave your body, you feel you may enter again...", 13)
		else			
			local MenuOpen = 1	
			local menu =
			{
				title = "Into the mists?",
				onStart = function(playerArg)
				end,
			options =
			{
				{
					"Stay",
					function(playerArg)
					end,
				},
				{
					"What did Yota say?",
					function(playerArg)
						player:PrintToPlayer("Something about trading Befouled Water...", 13)
					end,
				},
				{
					"Return",
					function(playerArg)
						player:setPos(595,-3,219,180,44)
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
		end
	end,

    })
    utils.unused(PathChoice)
end)

return m