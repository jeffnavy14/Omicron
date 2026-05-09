-----------------------------------
-- Announce when a player logs in
-----------------------------------
require('modules/module_utils')
-----------------------------------
local m = Module:new('announce_player_login')

m:addOverride('xi.player.onGameIn', function(player, firstLogin, zoning)
    super(player, firstLogin, zoning)

    if not zoning then
    	if player:getCharVar("NoOnlineNotification") ~= 1 then
    	    player:printToArea(string.format("%s has come online!", player:getName()), xi.msg.area.SYSTEM_2)
        end
    end
end)

return m
