---------------------------------------------------------------------------------------------------
-- func: mobuseability
-- desc: Forces the target monster to use an ability.
---------------------------------------------------------------------------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = "i"
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!home')
end

commandObj.onTrigger = function(player, ability)
    local target = player:getCursorTarget()

	if (ability == 0 or ability == nil) then
		player:printToPlayer(string.format('You must specify a monster ability!\n!mobusability <ability #>'), xi.msg.channel.SYSTEM_3)
		return 0
	end

    -- set level
    if target and (target:isMob() or target:getObjType() == xi.objType.TRUST) then
        player:printToPlayer(string.format('Forcing %s to use ability %i.', target:getName(), ability), xi.msg.channel.SYSTEM_3)

        target:useMobAbility(ability)
    else
		player:printToPlayer(string.format('You must target a monster first!'), xi.msg.channel.SYSTEM_3)
    end
end

return commandObj