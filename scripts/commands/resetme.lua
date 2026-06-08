---------------------------------------------------------------------------------------------------
-- func: !resetme
-- desc: Zones the player and returns them to the exact same spot
---------------------------------------------------------------------------------------------------

local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!resetme (player)')
end

commandObj.onTrigger = function(player)
	if
        player:getHP() < player:getMaxHP() and
        player:getGMLevel() == 0
    then
		error(player, string.format('You must have full HP to use this command!', player))
        return
	end

	if player:hasStatusEffect(xi.effect.BUST) then
		error(player, string.format('You must wait for certain status effects to wear off before using that command.', player))
		return
	end

	local party = player:getParty()

	for i, member in pairs(party) do
		if member:hasEnmity() and player:getGMLevel() < 1 then
			error(player, string.format('You cannot use that command while a member of your party is in combat.', player))
			return
		end
	end

    player:setPos(player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos(), player:getZoneID())
end
return commandObj