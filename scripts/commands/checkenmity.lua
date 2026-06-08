-----------------------------------
-- func: checkenmity
-- desc: gets enmity list
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = ''
}

-- function onTrigger(player, extendedMode)
commandObj.onTrigger = function(player, mobid)
    -- validate mobId
    local target

    if mobId == nil then
        target = player:getCursorTarget()

        if target == nil or not target:isMob() then
            player:printToPlayer(string.format(player,'You must target a mob.'),xi.msg.channel.SYSTEM_3)
            return
        end

        if not
            player:isEngaged() and
            not player:hasEnmity()
        then
            player:printToPlayer(string.format('You must be in combat.'),xi.msg.channel.SYSTEM_3)
            return
        end
    else
        target = GetMobByID(mobId)
        if target == nil then
            player:printToPlayer(string.format('Invalid mobID.'),xi.msg.channel.SYSTEM_3)
            return
        end
    end

	local enmityList = target:getEnmityList()
	local targName   = {}
	local targ
	local currentCE
	local currentVE

	for i, v in ipairs(enmityList) do
		targName[i] = v.entity:getName()

		if v.entity:isPC() then
			targ = GetPlayerByName(targName[i])
		else
			targ = v.entity
		end

		currentCE = target:getCE(targ)
		currentVE = target:getVE(targ)

		player:printToPlayer(string.format('%i : %s CE : %i  VE %i', i, targName[i], currentCE, currentVE),xi.msg.channel.SYSTEM_3)
	end
end

return commandObj
