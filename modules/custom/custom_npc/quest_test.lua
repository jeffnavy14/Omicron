-----------------------------------
require("modules/module_utils")
require("scripts/zones/Upper_Jeuno/Zone")
-----------------------------------
local m = Module:new("quest_test")
m:setEnabled(true)

m:addOverride("xi.zones.Upper_Jeuno.Zone.onInitialize", function(player, target, npc, status, vars)
-----------------------------------
require("modules/module_utils")
require('scripts/globals/items')
require('scripts/globals/keyitems')
require('scripts/globals/npc_util')
require('scripts/globals/quests')
require('scripts/globals/titles')
require('scripts/globals/zone')
require('scripts/globals/interaction/quest')
require("scripts/zones/Upper_Jeuno/Zone")
-----------------------------------
local quest = Quest:new(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.VW_OP_115_VALKURM_DUSTER)
quest.reward =
{
    fameArea = xi.quest.fame_area.JEUNO,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            -- TODO: Fame requirement needs verification
            return status == QUEST_AVAILABLE and
			player:getFameLevel(xi.quest.fame_area.JEUNO) >= 1 and
			player:getMainLvl() >= 74
        end,

        [xi.zone.UPPER_JEUNO] =
        {
            ['Edlina'] = 
			{
			onTrigger = function(player, npc)
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
                    player:PrintToPlayer("Your Quest Begins", xi.msg.channel.NS_SAY)
					quest:begin(player)
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
            },
		},
    },
	{
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED
        end,

        [xi.zone.UPPER_JEUNO] =
        {
            ['Edlina'] =
            {
                onTrigger = function(player, npc)
                    player:PrintToPlayer("Where is my shit?", xi.msg.channel.NS_SAY)
					
				end,
                onTrade = function(player, npc, trade)
                    player:PrintToPlayer("Good Job Dick Pickle!", xi.msg.channel.NS_SAY)
					quest:complete(player)		
				end,
            },
        },
    },
	{
        check = function(player, status, vars)
            return status == QUEST_COMPLETED
        end,

        [xi.zone.UPPER_JEUNO] =
        {
                        ['Edlina'] =
            {
                onTrigger = function(player, npc)
                    player:PrintToPlayer("Fuck off I already gave you your quest!", xi.msg.channel.NS_SAY)
				end,

            },
        },
    },
}

return quest
end)

return m