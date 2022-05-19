-----------------------------------
-- func: menu
-- desc: Shows a basic test menu with three options
-- note: title and options are required.
--     : onStart, onCancelled, and onEnd are optional.
--     : You must provide at least one option.
--     : Incorrectly creating or configuring a menu
--     : will not result in a crash or broken menus,
--     : but will produce scary looking warnings in
--     : the log.
-----------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
}

function onTrigger(player)
    local menu =
    {
        title = "Test Menu (Play Effect)",
        onStart = function(playerArg)
            -- NOTE: This could be used to lock the player in place
            playerArg:PrintToPlayer("Test Menu", xi.msg.channel.NS_SAY)
        end,
        options =
        {
            {
                "Option 1",
                function(playerarg)
                 player:startEvent (400)
                end,
            },
            {
                "Option 2",
                function(playerArg)
                    playerArg:PrintToPlayer("Option 2 Selected", xi.msg.channel.NS_SAY)
                    playerArg:independentAnimation(playerArg, 252, 4) -- Music Notes
                end,
            },
            {
                "Option 3",
                function(playerArg)
                    playerArg:PrintToPlayer("Option 3 Selected", xi.msg.channel.NS_SAY)
                    playerArg:independentAnimation(playerArg, 250, 4) -- Lightbulb
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
function onEventFinish(player, csid, option)
 if (csid == 400) then
     local menu =
    {
        title = "Test Menu (Play Effect)",
        onStart = function(playerArg)
            -- NOTE: This could be used to lock the player in place
            playerArg:PrintToPlayer("Test Menu", xi.msg.channel.NS_SAY)
        end,
        options =
        {
            {
                "Option 1",
                function(playerarg)
                 
                end,
            },
            {
                "Option 2",
                function(playerArg)
                    playerArg:PrintToPlayer("Option 2 Selected", xi.msg.channel.NS_SAY)
                    playerArg:independentAnimation(playerArg, 252, 4) -- Music Notes
                end,
            },
            {
                "Option 3",
                function(playerArg)
                    playerArg:PrintToPlayer("Option 3 Selected", xi.msg.channel.NS_SAY)
                    playerArg:independentAnimation(playerArg, 250, 4) -- Lightbulb
                end,
            },
        },
        onCancelled = function(playerArg)
player:release()
        end,
        onEnd = function(playerArg)
player:release()
        end,
    }
    player:customMenu(menu)
end
end