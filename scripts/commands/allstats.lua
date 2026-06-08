---------------------------------------------------------------------------------------------------
-- func: allstats
-- desc: updates all stats by value
---------------------------------------------------------------------------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = "i"
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!allstats')
end

commandObj.onTrigger = function(player, modvalue)
    local target = player:getCursorTarget()

	if (modvalue == 0 or modvalue == nil) then
		player:printToPlayer(string.format('You must specify a value to set stats to'), xi.msg.channel.SYSTEM_3)
		return 0
	end

    -- set level
    if target then
        target:addMod(xi.mod.STR, modvalue)
        target:addMod(xi.mod.DEX, modvalue)
        target:addMod(xi.mod.VIT, modvalue)
        target:addMod(xi.mod.AGI, modvalue)
        target:addMod(xi.mod.INT, modvalue)
        target:addMod(xi.mod.MND, modvalue)
        target:addMod(xi.mod.CHR, modvalue)

        player:printToPlayer(string.format('%s stats are set.', target:getName()), xi.msg.channel.SYSTEM_3)
        player:printToPlayer(string.format('STR - %i', target:getMod(xi.mod.STR)), xi.msg.channel.SYSTEM_3)
        player:printToPlayer(string.format('DEX - %i', target:getMod(xi.mod.DEX)), xi.msg.channel.SYSTEM_3)
        player:printToPlayer(string.format('VIT - %i', target:getMod(xi.mod.VIT)), xi.msg.channel.SYSTEM_3)
        player:printToPlayer(string.format('AGI - %i', target:getMod(xi.mod.AGI)), xi.msg.channel.SYSTEM_3)
        player:printToPlayer(string.format('INT - %i', target:getMod(xi.mod.INT)), xi.msg.channel.SYSTEM_3)
        player:printToPlayer(string.format('MND - %i', target:getMod(xi.mod.MND)), xi.msg.channel.SYSTEM_3)
        player:printToPlayer(string.format('CHR - %i', target:getMod(xi.mod.CHR)), xi.msg.channel.SYSTEM_3)


    else
		player:printToPlayer(string.format('You must select target first!'), xi.msg.channel.SYSTEM_3)
    end
end

return commandObj