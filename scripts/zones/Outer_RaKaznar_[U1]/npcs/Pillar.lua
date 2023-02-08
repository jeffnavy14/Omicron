-----------------------------------
-- npc: Pillar
-- used to spawn mob groups in Path 2 Custom Vagary
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local isBoss = math.random(1, 10)
		if GetServerVariable("P2Boss3") == 2 then
			player:setPos(0,0,0)
			player:changeMusic(0, 73)
			player:changeMusic(1, 73)
			player:changeMusic(2, 73)
			player:changeMusic(3, 73)
			player:changeMusic(4, 73)
			player:setCharVar("VagPathActive", 0)
			SetServerVariable("Vag2Active", 0)
			SetServerVariable("P2Kills", 0)
			SetServerVariable("P2Boss1", 0)
			SetServerVariable("P2Boss2", 0)
			SetServerVariable("P2Boss3", 0)
		elseif isBoss < 3 then
			-- Slime group
			local p1ID = 17903710
			repeat
				SpawnMob(p1ID)
				p1ID = p1ID + 1
			until p1ID == 17903725
			player:PrintToPlayer("Fragments of scattered memories begin to coalesce!", 13)
		elseif isBoss > 2 and isBoss < 5 then
			-- Leech Group
			local p1ID = 17903725
			repeat
				SpawnMob(p1ID)
				p1ID = p1ID + 1
			until p1ID == 17903740
			player:PrintToPlayer("Fragments of scattered memories begin to coalesce!", 13)
		elseif isBoss > 4 and isBoss < 7 then
			-- Obdella Group
			local p1ID = 17903740
			repeat
				SpawnMob(p1ID)
				p1ID = p1ID + 1
			until p1ID == 17903755
			player:PrintToPlayer("Fragments of scattered memories begin to coalesce!", 13)
		elseif isBoss > 6 then
			if (GetServerVariable("P2Boss1") == 0) then
				-- Leech Group w/ Murkcrawler
				SetServerVariable("P2Boss1", 1)
				local p1ID = 17903725
				repeat
					SpawnMob(p1ID)
					p1ID = p1ID + 1
				until p1ID == 17903740
				SpawnMob(17903755) -- Murkcrawler
				player:PrintToPlayer("Fragments of scattered memories begin to coalesce!", 13)
			elseif (GetServerVariable("P2Boss1") == 2) and (GetServerVariable("P2Boss2") == 0) then
				-- Slime group w/ Brimboil
				SetServerVariable("P2Boss2", 1)
				local p1ID = 17903710
				repeat
					SpawnMob(p1ID)
					p1ID = p1ID + 1
				until p1ID == 17903725
				SpawnMob(17903756) -- Brimboil
				player:PrintToPlayer("Fragments of scattered memories begin to coalesce!", 13)
			elseif (GetServerVariable("P2Boss1") == 2) and (GetServerVariable("P2Boss2") == 2) and (GetServerVariable("P2Boss3") == 0) then
				-- Obdella Group w/ Rancibus
				SetServerVariable("P2Boss3", 1)
				local p1ID = 17903740
				repeat
					SpawnMob(p1ID)
					p1ID = p1ID + 1
				until p1ID == 17903755
				SpawnMob(17903766) -- Rancibus
				player:changeMusic(0, 74)
				player:changeMusic(1, 74)
				player:changeMusic(2, 74)
				player:changeMusic(3, 74)
				player:changeMusic(4, 74)
				player:PrintToPlayer("A thousand scattered memories begin to take shape!", 13)
			else
				-- Slime group in place of boss 1 or 2 if they are already dead
				local p1ID = 17903617
				repeat
					SpawnMob(p1ID)
					p1ID = p1ID + 1
				until p1ID == 17903647
				player:PrintToPlayer("Fragments of scattered memories begin to coalesce!", 13)
			end
		end
		GetNPCByID(17904617):setStatus(xi.status.INVISIBLE)
		GetNPCByID(17904618):setStatus(xi.status.INVISIBLE)
		GetNPCByID(17904619):setStatus(xi.status.INVISIBLE)
		GetNPCByID(17904620):setStatus(xi.status.INVISIBLE)
		GetNPCByID(17904621):setStatus(xi.status.INVISIBLE)
		GetNPCByID(17904622):setStatus(xi.status.INVISIBLE)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
