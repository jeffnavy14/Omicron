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
        onTrigger = function(playerArg, npcArg, arg1, arg2)
local menu =
    {
        title = "Test Menu (Play Effect)",
        onStart = function(playerArg)

            playerArg:PrintToPlayer("Would you like to help me with something?", xi.msg.channel.NS_SAY)
        end,
        options =
        {
            {
                "Yes",
                function(playerArg)
                    player:PrintToPlayer("Your New Quest Begins!")
										player:setCharVar("Hardmode", 1)
						player:delStatusEffect(xi.effect.REGAIN)
						player:delStatusEffect(xi.effect.REFRESH)
						player:delStatusEffect(xi.effect.REGEN)
						player:delStatusEffect(xi.effect.HASTE)
						player:delStatusEffect(xi.effect.DEDICATION)
		
							-- Remove bonus mods..
						player:delMod(xi.mod.RACC, 100)
						player:delMod(xi.mod.RATT, 100)
						player:delMod(xi.mod.ACC, 100)
						player:delMod(xi.mod.ATT, 100)
						player:delMod(xi.mod.MATT, 100)
						player:delMod(xi.mod.MACC, 100)
						player:delMod(xi.mod.RDEF, 100)
						player:delMod(xi.mod.DEF, 100)
						player:delMod(xi.mod.MDEF, 100)

		if (player:getCharVar("Hardmode") == 1) then
        for i = xi.ki.MAP_OF_THE_SAN_DORIA_AREA, xi.ki.MAP_OF_DIO_ABDHALJS_GHELSBA do
            player:delKeyItem(i)
        end
        for i = xi.ki.MAP_OF_AL_ZAHBI, xi.ki.MAP_OF_RAKAZNAR do
            player:delKeyItem(i)
        end
        for i = xi.ki.MAP_OF_RALA_WATERWAYS_U, xi.ki.MAP_OF_RAKAZNAR_U do
            player:delKeyItem(i)
        end
        for i = xi.ki.MAP_OF_ESCHA_ZITAH, xi.ki.MAP_OF_REISENJIMA do
            player:delKeyItem(i)
        end
	end	
    	if (player:getCharVar("Hardmode") == 1) then
        player:setLevelCap(50)
		end
                end,
            },
            {
                "No thanks",
                function(playerArg)
 					player:PrintToPlayer("Sorry to hear that, please leave me be", xi.msg.channel.NS_SAY)
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
