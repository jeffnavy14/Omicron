-----------------------------------
--Random Quest Test
-----------------------------------
require('scripts/globals/items')
require('scripts/globals/keyitems')
require('scripts/globals/npc_util')
require('scripts/globals/quests')
require('scripts/globals/titles')
require('scripts/globals/zone')
require('scripts/globals/interaction/quest')
-----------------------------------

local quest = Quest:new(xi.quest.log_id.JEUNO, xi.quest.id.jeuno.NOT_SURE)
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
        title = "Quest Start", -- Starting of the quest menu
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
            return status == QUEST_ACCEPTED -- quest accepted, put your menu here
        end,

        [xi.zone.UPPER_JEUNO] =
        {
            ['Edlina'] =
            {   -- Place Menu option's here.
                onTrigger = function(player, npc)
                        local menu =
    {
        title = "Test Menu (Play Effect)",
        onStart = function(playerArg)
            -- NOTE: This could be used to lock the player in place
            playerArg:PrintToPlayer("Test Menu Opening", xi.msg.channel.NS_SAY)
        end,
        options =
        {
            {
                "Option 1: Hearts",
                function(playerArg)
                    playerArg:PrintToPlayer("Option 1 Selected", xi.msg.channel.NS_SAY)
                    playerArg:independentAnimation(playerArg, 251, 4) -- Hearts
                end,
            },
            {
                "Option 3: Lightbulb",
                function(playerArg)
                    playerArg:PrintToPlayer("Option 3 Selected", xi.msg.channel.NS_SAY)
                    playerArg:independentAnimation(playerArg, 250, 4) -- Lightbulb
                end,
            },
        },
        onCancelled = function(playerArg)
            playerArg:PrintToPlayer("Test Menu Cancelled", xi.msg.channel.NS_SAY)
        end,
        onEnd = function(playerArg)
            -- NOTE: This could be used to release a locked player,
            playerArg:PrintToPlayer("Test Menu Closing", xi.msg.channel.NS_SAY)
        end,
    }
    player:customMenu(menu)
					
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
            return status == QUEST_COMPLETED -- Completed Quest, Vana midnight wait
        end,

        [xi.zone.UPPER_JEUNO] =
        {
                        ['Edlina'] =
            {
                onTrigger = function(player, option, npc)
                    if quest:complete(player) then
					player:PrintToPlayer("Looks like you got what you needed, come back to me tomorrow!", xi.msg.channel.NS_SAY)
					quest:setVar(player, 'Timer', VanadielUniqueDay() + 1)
					elseif quest:getVar(player, 'Timer') <= VanadielUniqueDay() and quest:complete(player) then
					quest:begin(player)
					end
				end,

            },
        },
    },
}

return quest
