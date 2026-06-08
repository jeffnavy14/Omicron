-----------------------------------
-- func: help prints out list of player commands
-- desc:
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!help')
end

commandObj.onTrigger = function(player)
player:printToPlayer('!buff - Adds 500% Xp Bonus, and additonal bonuses', 3, xi.msg.channel.system_3)
player:printToPlayer('!dem - Will telport you to Tele-Dem if you have the crystal', 3, xi.msg.channel.system_3)
player:printToPlayer('!mea - Will telport you to Tele-Mea if you have the crystal', 3, xi.msg.channel.system_3)
player:printToPlayer('!holla - Will telport you to Tele-Holla if you have the crystal', 3, xi.msg.channel.system_3)
player:printToPlayer('!altepa - Will telport you to Tele-Altepe if you have the crystal', 3, xi.msg.channel.system_3)
player:printToPlayer('!vahzl - Will telport you to Tele-Vahzl if you have the crystal', 3, xi.msg.channel.system_3)
player:printToPlayer('!yhoator - Will telport you to Tele-Yhoator if you have the crystal', 3, xi.msg.channel.system_3)
player:printToPlayer('!home - Will teleport you to your set homepoint', 3, xi.msg.channel.system_3)
player:printToPlayer('!homereturn - Will teleport you back to your last coordinates you used !home at', 3, xi.msg.channel.system_3)
player:printToPlayer('!nosignet - To remove any form of Signet, Sanction etc', 3, xi.msg.channel.system_3)
player:printToPlayer('!signet - Applys Sanction, Sigil, Signet, Ionis based on zone', 3, xi.msg.channel.system_3)
player:printToPlayer('!jobshop - Opens up a Artifact Armor shop based on current job', 3, xi.msg.channel.system_3)
player:printToPlayer('!library - Teleports you to Celennia Memorial Library', 3, xi.msg.channel.system_3)
player:printToPlayer('!ah - Allows you to open up the AH anywhere in the world', 3, xi.msg.channel.system_3)
player:printToPlayer('!posfix - Fixes a characters pos who is offline but shows to be online', 3, xi.msg.channel.system_3)
player:printToPlayer('!resetme - Forces your character to rezone and return to same pos', 3, xi.msg.channel.system_3)
player:printToPlayer('!oldccfix - Adds all valid spells EXCEPT TRUSTS to the given target. If no target then to the current player.', 3, xi.msg.channel.system_3)
player:printToPlayer('!nmhuntone # - Displays the NMHunt kill count per tier, replace # with tier 1 - 3', 3, xi.msg.channel.system_3)
player:printToPlayer('!nmhunttwo # - Displays the NMHunt kill count per tier, replace # with tier 4 - 6', 3, xi.msg.channel.system_3)
player:printToPlayer('!addallportals - Gives players all portals Abyssea, Escha zones, Adoulin Waypoints.', 3, xi.msg.channel.system_3)
player:printToPlayer('!travel <autotranslate city> - Teleport player to spcified city!.', 3, xi.msg.channel.system_3)
player:printToPlayer('!mountain - Teleport player to top of Parradamo while in Abyssea Attohwa.', 3, xi.msg.channel.system_3)
player:printToPlayer('!paidmoles - Starts Whackamole in the current zone for 25M gil. 60min cooldown for current zone.', 3, xi.msg.channel.system_3)


end

return commandObj
