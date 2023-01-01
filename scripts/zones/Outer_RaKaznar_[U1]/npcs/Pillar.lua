-----------------------------------
--
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
			SpawnMob(17903648)
			SpawnMob(17903649)
			SpawnMob(17903650)
			SpawnMob(17903651)
			SpawnMob(17903652)
			player:PrintToPlayer("Fragments of scattered memories begin to coalesce!", 13)
		elseif isBoss > 2 and isBoss < 5 then
			SpawnMob(17903653)
			SpawnMob(17903654)
			SpawnMob(17903655)
			SpawnMob(17903656)
			SpawnMob(17903657)
			player:PrintToPlayer("Fragments of scattered memories begin to coalesce!", 13)
		elseif isBoss > 4 and isBoss < 7 then
			SpawnMob(17903658)
			SpawnMob(17903659)
			SpawnMob(17903660)
			SpawnMob(17903661)
			SpawnMob(17903662)
			player:PrintToPlayer("Fragments of scattered memories begin to coalesce!", 13)
		elseif isBoss > 6 then
			if (GetServerVariable("P2Boss1") == 0) then
				SetServerVariable("P2Boss1", 1)
				SpawnMob(17903653)
				SpawnMob(17903654)
				SpawnMob(17903655)
				SpawnMob(17903656)
				SpawnMob(17903657)
				SpawnMob(17903663)
				player:PrintToPlayer("Fragments of scattered memories begin to coalesce!", 13)
			elseif (GetServerVariable("P2Boss1") == 2) and (GetServerVariable("P2Boss2") == 0) then
				SetServerVariable("P2Boss2", 1)
				SpawnMob(17903648):updateEnmity(player)
				SpawnMob(17903649):updateEnmity(player)
				SpawnMob(17903650):updateEnmity(player)
				SpawnMob(17903651):updateEnmity(player)
				SpawnMob(17903652):updateEnmity(player)
				SpawnMob(17903664)
				player:PrintToPlayer("Fragments of scattered memories begin to coalesce!", 13)
			elseif (GetServerVariable("P2Boss1") == 2) and (GetServerVariable("P2Boss2") == 2) and (GetServerVariable("P2Boss3") == 0) then
				SetServerVariable("P2Boss3", 1)
				SpawnMob(17903658)
				SpawnMob(17903659)
				SpawnMob(17903660)
				SpawnMob(17903661)
				SpawnMob(17903662)
				SpawnMob(17903674)
				player:changeMusic(0, 74)
				player:changeMusic(1, 74)
				player:changeMusic(2, 74)
				player:changeMusic(3, 74)
				player:changeMusic(4, 74)
				player:PrintToPlayer("A thousand scattered memories begin to take shape!", 13)
			else
				SpawnMob(17903648)
				SpawnMob(17903649)
				SpawnMob(17903650)
				SpawnMob(17903651)
				SpawnMob(17903652)
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
