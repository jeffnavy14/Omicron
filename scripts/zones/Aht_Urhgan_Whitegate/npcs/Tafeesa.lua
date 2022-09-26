-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Tafeesa
-- Standard Info NPC
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
--    player:startEvent(655)
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
end


entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
