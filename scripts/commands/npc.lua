-----------------------------------
-- func: !npc
-- desc: Summon a NPC
-- note: Will spawn after you move from your current position
-----------------------------------

cmdprops =
{
    permission = 4,
    parameters = ""
}

function onTrigger(player)
    local zone = player:getZone()

    local npc = zone:insertDynamicEntity({
        -- NPC or MOB
        objtype = xi.objType.NPC,

        -- The name visible to players
        -- NOTE: Even if you plan on making the name invisible, we're using it internally for lookups
        --     : So populate it with something unique-ish even if you aren't going to use it.
        --     : You can then hide the name with entity:hideName(true)
        -- NOTE: This name CAN include spaces and underscores.
        name = "Test",
       
        -- You can use regular model ids (See documentation/model_ids.txt, or play around with !costume)
        look = 2430,

        -- You can also use the raw packet look information (as a string), as seen in npc_list and mob_pools
        -- look = "0x0100020500101120003000400050006000700000",
       
        -- Set the NPC at your current position, can set the position using in-game x, y and z if desired.
        x = player:getXPos(),
        y = player:getYPos(),
        z = player:getZPos(),
        rotation = player:getRotPos(),

        -- onTrade and onTrigger can be hooked up to your dynamic entity,
        -- just like with regular entities. You can also omit these.
        onTrade = function(playerArg, npcArg, trade)
            -- NOTE: We have to use getPacketName, because the regular name is modified and being used
            --     : for internal lookups
            player:PrintToPlayer("No, thanks!", 0, npcArg:getPacketName())
        end,

        -- The entity will not be "triggerable" unless you populate onTrigger
        onTrigger = function(player, playerArg, npc)
		
		local plevel = player:getMainLvl();
            if (plevel > 98) then
local menu =
    {
        title = "Apex Camp",
        onStart = function(playerArg)

            playerArg:PrintToPlayer("Which camp would you like to go to?", xi.msg.channel.NS_SAY)
        end,
        options =
        {
            {
                "Dho Gates",
                function(playerArg)
                player:setPos(-60.028, -9.969, 77.441, 204, 272)
                end,
            },
            {
                "Mho Gates",
                function(playerArg)
 					player:setPos(241.013, 19.986, -60.199, 144, 269)
                end,
            },
			{
                "Sih Gates",
                function(playerArg)
 					player:setPos(-77.528, -9.711, -259.626, 121, 268)
                end,
            },
			{
                "Woh Gates",
                function(playerArg)
 					player:setPos(300.857, 30.552, 72.162, 128, 273)
                end,
            },
			{
                "Reisenjima",
                function(playerArg)
 					player:setPos(-500.023, -19.074, -487.686, 190, 291)
                end,
            },
        },
		    onCancelled = function(playerArg)
			end,
			onEnd = function(playerArg)
			end,
    }
			player:customMenu(menu)
		else
            player:PrintToPlayer("Sorry not avail till LVL 99", 0x1F);
		end
        end,
    })
    player:PrintToPlayer(string.format("Please move to spawn (%s)", npc:getPacketName()))
end
