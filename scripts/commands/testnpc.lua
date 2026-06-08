----------------------------------
-- func: testnpc
-- desc: Summon a npc to test model
-- note:
-----------------------------------
local commandObj = {}

commandObj.cmdprops =
{
    permission = 3,
    parameters = ''
}


commandObj.onTrigger = function(player)
    local zoneOrInstanceObj = player:getZone()

    local instance = player:getInstance()
    if instance then
        zoneOrInstanceObj = instance
    end


    --[[ Decor
    00004701 - nothing
    00007005 - tree
    00006D05 - egg decoration
    00000605 - floating decoration
    0000E004 - tree
    00000E05 - bomb stand - windy ************************
    00000D05 - bomb stand sandy **********************
    00000F05 - Blue pumpkin table ****************
    0000F602 - umbrella
    0000D702 -- tree
    0000D802 -- tree
    00001605 - green pumpkin table ******************
    00001405 - red pumpkin table *****************
    00003400 - two trees
    01001E0282117020173017401750006000700000
    00002E01 - mandy
    0000D403 - paper on ground
    0x0000340000000000000000000000000000000000 -- two trees
    00004E01 -- baby dahlma
    0000BE05 -- AA taru hovering
    0000F702 -- blanlet with wall
    0000F802 -- shadow lord
    00008209 -- baby xion
    00000C08 - haloween blob **************************
    ]]--
  --[[
  name
  0xf4 glowing flowers


  3600 - 3650
  3188 = book == C74 == 74 0C
  3150+4 = glowing egg
  3150+21 = glowing orc
  268436452 = glowing portal
  268436496 - big decor
  268436758 = green pumpkin decor
  268436756 = red pumpkin decor
  268436751 = blue pumpkin decor
  268436980 chest decor
  268436979 bed decor
  268437247 = bomb on ground
  268437350 +22 to +37 - auras
  268437799 chair
  268437786 big crate
  268437850+40 & 41 - baby xion
  268437900+49 & 48 & 47 - shinning portals
  268438100 + 35 evil hades
  268438100 + 50 white hades
  268438200 +34 hut
  268438200 +35 baracade
  268438200 +36 stump
  2784 boat
  2785 wall
  2786 chair
  2787 raft
  2793, 2794 fruit basket
  268438250 + 12 big red plant
  268438250+ 22 bed
  268438250+31 red eye
  268438250+39 purple eye
  268438350+31 baby turtle
  268438350-268438450 - lots of babys
  0x0000000B00000000000000000000000000000000 - royal bed
  0000060900000000000000000000000000000000 - sandy flag with torches
  0000070900000000000000000000000000000000 - bastok flag with torches
  0000080900000000000000000000000000000000 - windy flag with torches
  0000090900000000000000000000000000000000 - beastmen flag with torches
  ]]--

     --     for i = 1, 100 do -- at 3600



    local npc = zoneOrInstanceObj:insertDynamicEntity({
        objtype = xi.objType.NPC,
        name = "\x3F\x0E", --..i,
       -- look = "0x01001D05A3104621A330A34046515A6100702180", -- + i,
        look = '0x01001D0749104920BA30BA40BA5033631D700000',
                -- 17293826 pumpkin
        --      0x0000000B00000000000000000000000000000000
        x = player:getXPos(), -- + i + 5,
        y = player:getYPos(),
        z = player:getZPos(),
        rotation = player:getRotPos(),
        entityFlags = 133,
        namevis     = 128,

        onTrade = function(player, npc, trade)
            xi.custom_quest.onTrade(player, npc, trade)
        end,
        onTrigger = function(player, npc)
            xi.custom_quest.onTrigger(player, npc)
        end,
        releaseIdOnDisappear = true,

    })

    utils.unused(npc)

end
 -- end
return commandObj


--[[ MID's
                00 00 16 09
                00 00 00 0B 
                05 00 03 02 00000000000000000000000000000000
                01 00 1D 02 4B 10 B7 20 B7 30 4B 40 B7 50 2E 63 2E 73 00 00
        look = '01 00 05 03 77 10 67 20 68 30 66 40 68 50 00 60 00 70 00 00',
                 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
        Index/Type  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
                       |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
                    hair  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
                       race  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
                          head  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
                             head  |  |  |  |  |  |  |  |  |  |  |  |  |  |
                                Body  |  |  |  |  |  |  |  |  |  |  |  |  |
                                   body  |  |  |  |  |  |  |  |  |  |  |  |
                                     hands  |  |  |  |  |  |  |  |  |  |  |
                                        hands  |  |  |  |  |  |  |  |  |  |
                                            legs  |  |  |  |  |  |  |  |  |
                                               legs  |  |  |  |  |  |  |  |
                                                  feet  |  |  |  |  |  |  |
                                                     feet  |  |  |  |  |  |
                                                 main weapon  |  |  |  |  |
                                                    main weapon  |  |  |  |
                                                        sub weapon  |  |  |
                                                           sub weapon  |  |
                                                                          |

0x 01 00 1D 07 84 11 59 20 43 30 59 40 43 50 FF 62 38 73 00 00


 elvan      01 00 1D 03 4B 10 B7 20 B7 30 4B 40 B7 50 2E 63 3C 72 00 00 (572 = 23C)
  elvan      0x 01 00 1D 03 8411 4D20 4D30 4940 4950 3C62 3873 0000
 galka      01 00 1D 08 4B 10 B7 20 B7 30 4B 40 B7 50 2E 63 32 72 00 00 (562 = 232)
  galka      0x01001D088411 4F20 4130 4140 4150 326238730000
 taru       01 00 1D 05 4B 10 B7 20 B7 30 4B 40 B7 50 2E 63 20 72 00 00 (544 = 220)
  taru       0x01001D058411 4720 4730 4B40 4B50 206238730000

 2ff = 767 mid = ff62 main or ff72 offhand
]]--