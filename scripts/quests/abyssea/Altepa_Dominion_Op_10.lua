-----------------------------------
-- Altepa - Dominion Op #10
-----------------------------------
-----------------------------------
require('scripts/globals/interaction/quest')
require('scripts/globals/abyssea/dominion')
require('scripts/globals/quests')
-----------------------------------

local quest = Quest:new(xi.quest.log_id.ABYSSEA, xi.quest.id.abyssea.DOMINION_OP_10_ALTEPA)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == QUEST_ACCEPTED
        end,

        [xi.zone.ABYSSEA_ALTEPA] =
        {
            ['Gastornis'] =
            {
                onMobDeath = function(mob, player, optParams)
                    xi.abyssea.dominionOnMobDeath(mob, player, 569)
                end,
            },
        },
    },
}

return quest