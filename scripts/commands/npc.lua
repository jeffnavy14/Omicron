-----------------------------------
-- func: !npc
-- desc: Test dynamic entity before its placed into a module for testing.
-- note: Will spawn after you move from your current position
-----------------------------------

-----------------------------------

local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = ''
}

commandObj.onTrigger = function(player)
    local zone = player:getZone()
    local npc = zone:insertDynamicEntity({
    objtype = xi.objType.NPC,
    name = "HNM 2.0",
	look = 2401,
    x = player:getXPos(),
    y = player:getYPos(),
    z = player:getZPos(),
    rotation = player:getRotPos(),

        onTrigger = function(player, npc)
			 local menu =
        {
            title = "Kupo Medallion",
            onStart = function(playerArg)
                -- NOTE: This could be used to lock the player in place
                playerArg:PrintToPlayer("I require 10 Merit Points for my Special Medallion!", xi.msg.channel.NS_SAY)
            end,
            options =
            {
                {
                    "Yes",
                    function(playerArg)
					if player:hasKeyItem(xi.ki.KUPOFRIEDS_MEDALLION) then
					playerArg:PrintToPlayer("I cannot give you something you already have!!!", xi.msg.channel.NS_SAY)
					elseif player:getMeritCount() > 9 then
						player:setMerits(player:getMeritCount() - 10)
						npcUtil.giveKeyItem(player, xi.ki.KUPOFRIEDS_MEDALLION)
						playerArg:PrintToPlayer("I hope this helps you in your hunt!!", xi.msg.channel.NS_SAY)
					end
					end,
				},
                {
                    "No",
                    function(playerArg)
                    playerArg:PrintToPlayer("When you are ready come back to see me kuppo!", xi.msg.channel.NS_SAY)
                    end,
                },
            },
            onCancelled = function(playerArg)
            end,
            onEnd = function(playerArg)
			end,
        }
          player:customMenu(menu)
		end,
    })
    player:PrintToPlayer(string.format("Please move to spawn (%s)", npc:getPacketName()))
end

return commandObj