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
        title = "Lots of Menu's",
        onStart = function(playerArg)
            -- NOTE: This could be used to lock the player in place
            playerArg:PrintToPlayer("Test Menu Opening", xi.msg.channel.NS_SAY)
        end,
        options =
        {
            {
                "Menu 1",
                function(playerArg)
                  								
  local menu =
    {
        title = "Menu 1",
        options =
        {
            {
                "Option 1",
                function(playerArg)
                    player:setPos( 13.05, -14.55, 70.05, 119, 248)
                end,
            },
            {
                "Option 2",
                function(playerArg)
                    player:setPos( 13.05, -14.55, 70.05, 119, 248)
                end,
            },
            {
                "Option 3",
                function(playerArg)
                    player:setPos( 13.05, -14.55, 70.05, 119, 248)
                end,
            },
        },
    }
				player:customMenu(menu)
                end,
            },
            {
                "Menu 2",
                function(playerArg)
                   								
  local menu2 =
    {
        title = "Menu 2",
        options =
        {
            {
                "Option 1",
                function(playerArg)
                    player:setPos( 13.05, -14.55, 70.05, 119, 248)
                end,
            },
            {
                "Option 2",
                function(playerArg)
                    player:setPos( 13.05, -14.55, 70.05, 119, 248)
                end,
            },
            {
                "Option 3",
                function(playerArg)
                    player:setPos( 13.05, -14.55, 70.05, 119, 248)
                end,
            },
        },
    }
				player:customMenu(menu2)
                end,
            },
            {
                "Menu 3",
                function(playerArg)
								
  local menu3 =
    {
        title = "Menu 3",
        options =
        {
            {
                "Option 1",
                function(playerArg)
                    player:setPos( 13.05, -14.55, 70.05, 119, 248)
                end,
            },
            {
                "Option 2",
                function(playerArg)
                    player:setPos( 13.05, -14.55, 70.05, 119, 248)
                end,
            },
            {
                "Option 3",
                function(playerArg)
                    player:setPos( 13.05, -14.55, 70.05, 119, 248)
                end,
            },
        },
    }
				player:customMenu(menu3)
                end,
            },
        },
    }
    player:customMenu(menu)
end
