-----------------------------------
-- Area: Port Jeuno
--  NPC: Oboro
-- Type: Artifact Weapon Upgrader and Relic Upgrader
-----------------------------------
local ID = require("scripts/zones/Port_Jeuno/IDs")
require("scripts/globals/chocobo")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------------
local entity = {}
-----------------------------------
-- onTrade Action
-----------------------------------

entity.onTrade = function(player, npc, trade)
  local level = player:getMainLvl()
  local job = player:getMainJob()
  --------------------------------------------------------
  --       WAR TRADE Voulge 18214                       --
  --------------------------------------------------------
  if (job == 1) and (trade:hasItemQty(18214, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(18214, 1, 45, 16)
    player:setCharVar("WARAFweapon", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18214)

  end
  if (job == 1) and (trade:hasItemQty(18214, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("WARAFweapon") == 1) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(18214, 1, 45, 25, 25, 4) -- Attack +5
    player:setCharVar("WARAFweapon", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18214)

  end
  if (job == 1) and (trade:hasItemQty(18214, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("WARAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(18214, 1, 76, 1, 25, 6) -- Attack +7
    player:setCharVar("WARAFweapon", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18214)

  end

  --------------------------------------------------------
  --       MONK TRADE Beat Cesti 17478                  --
  --------------------------------------------------------


  if (job == 2) and (trade:hasItemQty(17478, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17478, 1, 45, 5)
    player:setCharVar("MNKAFweapon", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17478)

  end
  if (job == 2) and (trade:hasItemQty(17478, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("MNKAFweapon") == 1) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17478, 1, 45, 9, 25, 4) -- Attack +5
    player:setCharVar("MNKAFweapon", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17478)

  end
  if (job == 2) and (trade:hasItemQty(17478, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("MNKAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17478, 1, 45, 15, 25, 6) -- Attack +7
    player:setCharVar("MNKAFweapon", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17478)

  end



  --------------------------------------------------------
  --      WHITE MAGE TRADE Blessed Hammer 17422         --
  --------------------------------------------------------

  if (job == 3) and (trade:hasItemQty(17422, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17422, 1, 45, 3, 329, 9) -- Cure Potency +10%
    player:setCharVar("WHMAFweapon", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17422)

  end
  if (job == 3) and (trade:hasItemQty(17422, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("WHMAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17422, 1, 45, 7, 329, 10) -- Cure Potency +11%
    player:setCharVar("WHMAFweapon", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17422)

  end
  if (job == 3) and (trade:hasItemQty(17422, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("WHMAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17422, 1, 45, 12, 329, 11) -- Cure Potency +12%
    player:setCharVar("WHMAFweapon", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17422)

  end



  --------------------------------------------------------
  --      BLACK MAGE TRADE DUSKY STAFF 17572             --
  --------------------------------------------------------



  if (job == 4) and (trade:hasItemQty(17572, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17572, 1, 45, 9, 133, 9)
    player:setCharVar("BLMAFweapon", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17572)

  end
  if (job == 4) and (trade:hasItemQty(17572, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("BLMAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17572, 1, 45, 76, 0, 133, 10)
    player:setCharVar("BLMAFweapon", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17572)

  end
  if (job == 4) and (trade:hasItemQty(17572, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("BLMAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17572, 1, 76, 12, 133, 11)
    player:setCharVar("BLMAFweapon", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17572)

  end

  --------------------------------------------------------
  --      RED MAGE TRADE FENCING DEGEN 16829            --
  --------------------------------------------------------



  if (job == 5) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16829, 1, 45, 4, 140, 1) -- Fast Cast +2
    player:setCharVar("RDMAFweapon", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16829)

  end
  if (job == 5) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("RDMAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16829, 1, 45, 9, 140, 2) -- Fast Cast +3
    player:setCharVar("RDMAFweapon", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16829)

  end
  if (job == 5) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("RDMAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16829, 1, 45, 14, 140, 3) -- Fast Cast +4
    player:setCharVar("RDMAFweapon", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16829)

  end


  --------------------------------------------------------
  --      THF TRADE MARAUDER'S KNIFE 16764              --
  --------------------------------------------------------



  if (job == 6) and (trade:hasItemQty(16764, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16764, 1, 45, 4, 41, 1)  -- Crit hitrate +2
    player:setCharVar("THFAFweapon", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16764)

  end
  if (job == 6) and (trade:hasItemQty(16764, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("THFAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16764, 1, 45, 9, 41, 2)  -- Crit hitrate +3
    player:setCharVar("THFAFweapon", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16764)

  end
  if (job == 6) and (trade:hasItemQty(16764, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("THFAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16764, 1, 45, 14, 41, 3)  -- Crit hitrate +4
    player:setCharVar("THFAFweapon", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16764)

  end


  --------------------------------------------------------
  --      PLD TRADE HONOR SWORD 17643                   --
  --------------------------------------------------------



  if (job == 7) and (trade:hasItemQty(17643, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17643, 1, 45, 2, 39, 1) -- DMG+3 Enmity +2
    player:setCharVar("PLDAFweapon", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17643)

  end
  if (job == 7) and (trade:hasItemQty(17643, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("PLDAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17643, 1, 45, 6, 25, 4, 39, 2)  -- Attack +5 Enmity +3
    player:setCharVar("PLDAFweapon", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17643)

  end
  if (job == 7) and (trade:hasItemQty(17643, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("PLDAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17643, 1, 45, 9, 25, 6, 39, 3) -- Attack +7 Enmity +4
    player:setCharVar("PLDAFweapon", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17643)

  end



  --------------------------------------------------------
  --      PLD TRADE HEATER SHIELD 12307                 --
  --------------------------------------------------------



  if (job == 7) and (trade:hasItemQty(12307, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(12307, 1, 33, 4)
    player:setCharVar("PLDAFshield", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 12307)

  end
  if (job == 7) and (trade:hasItemQty(12307, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("PLDAFshield") == 1)  then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(12307, 1, 33, 9)
    player:setCharVar("PLDAFshield", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 12307)

  end
  if (job == 7) and (trade:hasItemQty(12307, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("PLDAFshield") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(12307, 1, 33, 9, 286, 4)  -- +5 DEF and +5 Shield Skill
    player:setCharVar("PLDAFshield", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 12307)

  end




  --------------------------------------------------------
  --      DRK TRADE RAVEN SCYTHE 16798                  --
  --------------------------------------------------------



  if (job == 8) and (trade:hasItemQty(16798, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16798, 1, 45, 6)
    player:setCharVar("DRKAFweapon", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16798)

  end
  if (job == 8) and (trade:hasItemQty(16798, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("DRKAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16798, 1, 45, 14, 25, 4)
    player:setCharVar("DRKAFweapon", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16798)

  end
  if (job == 8) and (trade:hasItemQty(16798, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("DRKAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16798, 1, 45, 22, 25, 6)
    player:setCharVar("DRKAFweapon", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16798)

  end




  --------------------------------------------------------
  --      DRK TRADE GREATSWORD 16590                    --
  --------------------------------------------------------



  if (job == 8) and (trade:hasItemQty(16590, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16590, 1, 45, 7)
    player:setCharVar("DRKAFweapongs", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16590)

  end
  if (job == 8) and (trade:hasItemQty(16590, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("DRKAFweapongs") == 1)  then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16590, 1, 45, 15, 25, 4)
    player:setCharVar("DRKAFweapongs", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16590)

  end
  if (job == 8) and (trade:hasItemQty(16590, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("DRKAFweapongs") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16590, 1, 45, 23, 25, 6)
    player:setCharVar("DRKAFweapongs", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16590)

  end


  --------------------------------------------------------
  --      BST TRADE BARABORI AXE 16680                  --
  --------------------------------------------------------



  if (job == 9) and (trade:hasItemQty(16680, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16680, 1, 45, 3)
    player:setCharVar("BSTAFweapon", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16680)

  end
  if (job == 9) and (trade:hasItemQty(16680, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("BSTAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16680, 1, 45, 7, 43, 2)
    player:setCharVar("BSTAFweapon", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16680)

  end
  if (job == 9) and (trade:hasItemQty(16680, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("BSTAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16680, 1, 45, 11, 43, 4)
    player:setCharVar("BSTAFweapon", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16680)

  end



  --------------------------------------------------------
  --      BRD TRADE PAPER KNIFE 16766                   --
  --------------------------------------------------------



  if (job == 10) and (trade:hasItemQty(16766, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16766, 1, 45, 4, 337, 1)  -- Song Recast
    player:setCharVar("BRDAFweapon", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16766)

  end
  if (job == 10) and (trade:hasItemQty(16766, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("BRDAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16766, 1, 45, 9, 337, 2)
    player:setCharVar("BRDAFweapon", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16766)

  end
  if (job == 10) and (trade:hasItemQty(16766, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("BRDAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16766, 1, 45, 14, 337, 3)
    player:setCharVar("BRDAFweapon", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16766)

  end


  --------------------------------------------------------
  --             BRD TRADE HORN 17352                   --
  --------------------------------------------------------

  -- singing and wind skill +2/3/4


  if (job == 10) and (trade:hasItemQty(17352, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17352, 1, 296, 2, 298, 2)
    player:setCharVar("BRDAFhorn", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17352)

  end
  if (job == 10) and (trade:hasItemQty(17352, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("BRDAFhorn") == 1)  then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17352, 1, 296, 3, 298, 3)
    player:setCharVar("BRDAFhorn", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17352)

  end
  if (job == 10) and (trade:hasItemQty(17352, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("BRDAFhorn") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17352, 1, 296, 4, 298, 4)
    player:setCharVar("BRDAFhorn", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17352)

  end


  --------------------------------------------------------
  --          BRD TRADE LAMIA HARP 17356                --
  --------------------------------------------------------

  -- SONG Spellcasting Time


  if (job == 10) and (trade:hasItemQty(17356, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17356, 1, 322, 2)
    player:setCharVar("BRDAFharp", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17356)

  end
  if (job == 10) and (trade:hasItemQty(17356, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("BRDAFharp") == 1)  then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17356, 1, 322, 3)
    player:setCharVar("BRDAFharp", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17356)

  end
  if (job == 10) and (trade:hasItemQty(17356, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("BRDAFharp") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17356, 1, 322, 4)
    player:setCharVar("BRDAFharp", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17356)

  end


  --------------------------------------------------------
  --          BRD TRADE JUDGES BOW 17174                --
  --------------------------------------------------------

  if (job == 10 and (trade:hasItemQty(17174, 1)) and level >= 15 and (player:getCharVar("BRDJudgesBow") == 1)) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Remember after level 45 I require 5000g per upgrade for this bow!", 0xD)
    player:addItem(17174,1,750,31,751,18) -- DMG -82
    player:setCharVar("BRDJudgesBow",2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17174)
  end
  if (job == 10 and (trade:hasItemQty(17174, 1)) and level >= 25 and (player:getCharVar("BRDJudgesBow") == 2)) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Remember after level 45 I require 5000g per upgrade for this bow!", 0xD)
    player:addItem(17174,1,750,31,751,9)  -- DMG -73
    player:setCharVar("BRDJudgesBow",3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17174)
  end
  if (job == 10 and (trade:hasItemQty(17174, 1)) and level >= 35 and (player:getCharVar("BRDJudgesBow") == 3)) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Remember after level 45 I require 5000g per upgrade for this bow!", 0xD)
    player:addItem(17174,1,750,31,751,1)  -- DMG -64
    player:setCharVar("BRDJudgesBow",4)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17174)
  end
  if (job == 10 and (trade:hasItemQty(17174, 1)) and level >= 45 and (player:getCharVar("BRDJudgesBow") == 4)) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Remember after level 45 I require 5000g per upgrade for this bow!", 0xD)
    player:addItem(17174,1,750,24,751,0)  -- DMG -58
    player:setCharVar("BRDJudgesBow",5)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17174)
  end
  if (job == 10 and (trade:hasItemQty(17174, 1)) and level >= 55 and (player:getCharVar("BRDJudgesBow") == 5) and trade:getGil() == 5000) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Next time I require 5000g to upgrade this bow!", 0xD)
    player:addItem(17174,1,750,16,751,0,35,4)  -- DMG -48/Magic Acc+5
    player:setCharVar("BRDJudgesBow",6)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17174)
  elseif (job == 10 and (trade:hasItemQty(17174, 1)) and level >= 55 and (player:getCharVar("BRDJudgesBow") == 5)) then
    player:PrintToPlayer("Oboro : I require 5000g to upgrade this bow!", 0xD)
  end
  if (job == 10 and (trade:hasItemQty(17174, 1)) and level >= 65 and (player:getCharVar("BRDJudgesBow") == 6) and trade:getGil() == 5000) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Next time I require 10000g to upgrade this bow!", 0xD)
    player:addItem(17174,1,750,6,751,0,35,6)  -- DMG -39
    player:setCharVar("BRDJudgesBow",7)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17174)
  elseif (job == 10 and (trade:hasItemQty(17174, 1)) and level >= 65 and (player:getCharVar("BRDJudgesBow") == 6)) then
    player:PrintToPlayer("Oboro : I require 5000g to upgrade this bow!", 0xD)
  end
  if (job == 10 and (trade:hasItemQty(17174, 1)) and level >= 75 and (player:getCharVar("BRDJudgesBow") == 7)) and trade:getGil(10000) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Here you go!  Not much else I can do at this time.", 0xD)
    player:addItem(17174,1,750,31,35,9,27,19)  -- DMG -32
    player:setCharVar("BRDJudgesBow",8)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17174)
  elseif (job == 10 and (trade:hasItemQty(17174, 1)) and level >= 75 and (player:getCharVar("BRDJudgesBow") == 7)) then
    player:PrintToPlayer("Oboro : I require 10000g to upgrade this bow!", 0xD)
  end



  --------------------------------------------------------
  --          BRD TRADE JUDGES ARROW 17324              --
  --------------------------------------------------------
  local tcount = trade:getItemQty(17330)

  if (tcount > 0 and job == 10 and level >=65 and trade:hasItemQty(17330,tcount)) then
    player:tradeComplete()
    player:addItem(17326,tcount,751,31,212,9)
    player:PrintToPlayer("Oboro : Here you go!  Not much else I can do at this time.", 0xD)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17326)
  elseif(tcount > 0 and job == 10 and level >=55 and trade:hasItemQty(17330,tcount)) then
    player:tradeComplete()
    player:addItem(17326,tcount,750,4,751,31)
    player:PrintToPlayer("Oboro : Here you go!", 0xD)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17326)
  elseif(tcount > 0 and job == 10 and level >=45 and trade:hasItemQty(17330,tcount)) then
    player:tradeComplete()
    player:addItem(17326,tcount,750,7,751,31)
    player:PrintToPlayer("Oboro : Here you go!", 0xD)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17326)
  elseif(tcount > 0 and job == 10 and level >=35 and trade:hasItemQty(17330,tcount)) then
    player:tradeComplete()
    player:addItem(17326,tcount,750,14,751,31)
    player:PrintToPlayer("Oboro : Here you go!", 0xD)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17326)
  elseif(tcount > 0 and job == 10 and level >=25 and trade:hasItemQty(17330,tcount)) then
    player:tradeComplete()
    player:addItem(17326,tcount,750,17,751,31)
    player:PrintToPlayer("Oboro : Here you go!", 0xD)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17326)
  elseif(tcount > 0 and job == 10 and level >=15 and trade:hasItemQty(17330,tcount)) then
    player:tradeComplete()
    player:addItem(17326,tcount,750,22,751,31)
    player:PrintToPlayer("Oboro : Here you go!", 0xD)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17326)
  elseif(tcount > 0 and job == 10 and level >=5 and trade:hasItemQty(17330,tcount)) then
    player:tradeComplete()
    player:addItem(17326,tcount,750,29,751,31)
    player:PrintToPlayer("Oboro : Here you go!", 0xD)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17326)
  end



  --------------------------------------------------------
  --      RNG TRADE SNIPING BOW 17188                   --
  --------------------------------------------------------



  if (job == 11) and (trade:hasItemQty(17188, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17188, 1, 45, 11)
    player:setCharVar("RNGAFweaponbow", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17188)

  end
  if (job == 11) and (trade:hasItemQty(17188, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("RNGAFweaponbow") == 1)  then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17188, 1, 45, 24, 29, 4)
    player:setCharVar("RNGAFweaponbow", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17188)

  end
  if (job == 11) and (trade:hasItemQty(17188, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("RNGAFweaponbow") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17188, 1, 76, 3, 29, 6)
    player:setCharVar("RNGAFweaponbow", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17188)

  end



  --------------------------------------------------------
  --      RNG TRADE SERPENTINE GUN 17256                --
  --------------------------------------------------------



  if (job == 11) and (trade:hasItemQty(17256, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17256, 1, 45, 4)
    player:setCharVar("RNGAFweapongun", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17256)

  end
  if (job == 11) and (trade:hasItemQty(17256, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("RNGAFweapongun") == 1)  then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17256, 1, 45, 8, 29, 4)
    player:setCharVar("RNGAFweapongun", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17256)

  end
  if (job == 11) and (trade:hasItemQty(17256, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("RNGAFweapongun") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17256, 1, 45, 11, 29, 6)
    player:setCharVar("RNGAFweapongun", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17256)

  end



  --------------------------------------------------------
  --         RNG TRADE ZAMBURAK 17218                   --
  --------------------------------------------------------



  if (job == 11) and (trade:hasItemQty(17218, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17218, 1, 45, 6)
    player:setCharVar("RNGAFweaponxbow", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17218)

  end
  if (job == 11) and (trade:hasItemQty(17218, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("RNGAFweaponxbow") == 1)  then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17218, 1, 45, 10, 29, 4)
    player:setCharVar("RNGAFweaponxbow", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17218)

  end
  if (job == 11) and (trade:hasItemQty(17218, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("RNGAFweaponxbow") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17218, 1, 45, 13, 29, 6)
    player:setCharVar("RNGAFweaponxbow", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17218)

  end


  --------------------------------------------------------
  --            SAM TRADE MAGOROKU 17812                --
  --------------------------------------------------------



  if (job == 12) and (trade:hasItemQty(17812, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17812, 1, 45, 5)
    player:setCharVar("SAMAFweapon", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17812)

  end
  if (job == 12) and (trade:hasItemQty(17812, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("SAMAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17812, 1, 45, 12, 142, 1)
    player:setCharVar("SAMAFweapon", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17812)

  end
  if (job == 12) and (trade:hasItemQty(17812, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("SAMAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17812, 1, 45, 19, 142, 2)
    player:setCharVar("SAMAFweapon", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17812)

  end



  --------------------------------------------------------
  --      NIN TRADE ANJU & ZUSHIO 17771 / 17772         --
  --------------------------------------------------------



  if (job == 13) and (trade:hasItemQty(17771, 1)) and (trade:hasItemQty(17772, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Well Done.  Here are your items")
    player:addItem(17771, 1, 45, 3)
    player:addItem(17772, 1, 45, 2)
    player:setCharVar("NINAFweapon", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17771)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17772)

  end
  if (job == 13) and (trade:hasItemQty(17771, 1)) and (trade:hasItemQty(17772, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("NINAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Well Done.  Here are your items")
    player:addItem(17771, 1, 45, 7, 25, 1)
    player:addItem(17772, 1, 45, 6, 25, 2)
    player:setCharVar("NINAFweapon", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17771)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17772)

  end
  if (job == 13) and (trade:hasItemQty(17771, 1)) and (trade:hasItemQty(17772, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("NINAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Well Done.  Here are your items")
    player:addItem(17771, 1, 45, 11, 25, 2)
    player:addItem(17772, 1, 45, 10, 25, 3)
    player:setCharVar("NINAFweapon", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17771)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17772)

  end


  --------------------------------------------------------
  --            DRG TRADE PEREGRINE 16887               --
  --------------------------------------------------------



  if (job == 14) and (trade:hasItemQty(16887, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16887, 1, 45, 6)
    player:setCharVar("DRGAFweapon", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16887)

  end
  if (job == 14) and (trade:hasItemQty(16887, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("DRGAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16887, 1, 45, 14, 25, 4)
    player:setCharVar("DRGAFweapon", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16887)

  end
  if (job == 14) and (trade:hasItemQty(16887, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("DRGAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16887, 1, 45, 22, 25, 6)
    player:setCharVar("DRGAFweapon", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16887)

  end




  --------------------------------------------------------
  --         SMN TRADE DRAGON STAFF 17597               --
  --------------------------------------------------------



  if (job == 15) and (trade:hasItemQty(17597, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17597, 1, 45, 11, 321, 1)
    player:setCharVar("SMNAFweapon", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17597)

  end
  if (job == 15) and (trade:hasItemQty(17597, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("SMNAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17597, 1, 45, 23, 321, 1)
    player:setCharVar("SMNAFweapon", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17597)

  end
  if (job == 15) and (trade:hasItemQty(17597, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("SMNAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17597, 1, 76, 1, 321, 1)
    player:setCharVar("SMNAFweapon", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17597)

  end


  --------------------------------------------------------
  --         BLU TRADE IMMORTAL SCIMITAR  17717         --
  --------------------------------------------------------


  if (job == 16) and (trade:hasItemQty(17717, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17717, 1, 45, 3, 550, 1) -- STR/DEX+2
    player:setCharVar("BLUAFweapon", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17717)

  end
  if (job == 16) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("BLUAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16829, 1, 45, 8, 550, 3) -- STR/DEX+4
    player:setCharVar("BLUAFweapon", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17717)

  end
  if (job == 16) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("BLUAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16829, 1, 45, 13, 550, 5) -- STR/DEX+6
    player:setCharVar("BLUAFweapon", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17717)

  end




  --------------------------------------------------------
  --      COR TRADE HEXAGUN 18702                    --
  --------------------------------------------------------



  if (job == 17) and (trade:hasItemQty(18702, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(18702, 1, 45, 2, 29, 2, 27, 2)
    player:setCharVar("CORAFweapon", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18702)

  end
  if (job == 17) and (trade:hasItemQty(18702, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("CORAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(18702, 1, 45, 5, 29, 4, 27, 4)
    player:setCharVar("CORAFweapon", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18702)

  end
  if (job == 17) and (trade:hasItemQty(18702, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("CORAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(18702, 1, 45, 8, 29, 6, 27, 6)
    player:setCharVar("CORAFweapon", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18702)
  end


  --------------------------------------------------------
  --      PUP TRADE ADARGAS 18353                     --
  --------------------------------------------------------

  if (job == 18) and (level >=47) and (player:hasItem(18353) == false) and (player:getCharVar("PUPAFweapon") == 0) and trade:getGil(5000) then
    player:addItem(18353, 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18353)
    player:setCharVar("PUPAFweapon",1)
    player:PrintToPlayer("Oboro : Don't go off losing that weapon again or I will be very angry.", 0xD)
  end


  if (job == 18) and (trade:hasItemQty(18353, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("PUPAFweapon") == 1) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(18353, 1, 45, 2, 25, 4) -- Attack +5
    player:setCharVar("PUPAFweapon", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18353)

  end
  if (job == 18) and (trade:hasItemQty(18353, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("PUPAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(18353, 1, 45, 5, 25, 6) -- Attack +7
    player:setCharVar("PUPAFweapon", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18353)

  end



  --------------------------------------------------------
  --      DNC TRADE Mythril Knife 16467                    --
  --------------------------------------------------------

  if (job == 19) and (trade:hasItemQty(16467, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16467, 1, 45, 4, 518, 1)
    player:setCharVar("DNCAFweapon", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16467)

  end
  if (job == 19) and (trade:hasItemQty(16467, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("DNCAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16467, 1, 45, 7, 518, 2, 330, 1)
    player:setCharVar("DNCAFweapon", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16467)

  end
  if (job == 19) and (trade:hasItemQty(16467, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("DNCAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(16467, 1, 45, 10, 518, 3, 330, 2)
    player:setCharVar("DNCAFweapon", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16467)
  end





  --------------------------------------------------------
  --      SCH TRADE OAK POLE 17098                     --
  --------------------------------------------------------

  if (job == 20) and (trade:hasItemQty(17098, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17098, 1, 45, 11, 141, 2)
    player:setCharVar("SCHAFweapon", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17098)

  end
  if (job == 20) and (trade:hasItemQty(17098, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("SCHAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17098, 1, 45, 23, 141, 4)
    player:setCharVar("SCHAFweapon", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17098)

  end
  if (job == 20) and (trade:hasItemQty(17098, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("SCHAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(17098, 1, 45, 30, 141, 6)
    player:setCharVar("SCHAFweapon", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17098)
  end



  --------------------------------------------------------
  --       GEO TRADE Matre Bell 21460                  --
  --------------------------------------------------------


  if (job == 21) and (trade:hasItemQty(21460, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(21460, 1, 9, 14) -- MP+15
    player:setCharVar("GEOAFweapon", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 21460)

  end
  if (job == 21) and (trade:hasItemQty(21460, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("GEOAFweapon") == 1) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(21460, 1, 9, 19, 1250, 9) -- MP+20, Indi Duration + 10
    player:setCharVar("GEOAFweapon", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 21460)

  end
  if (job == 21) and (trade:hasItemQty(21460, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("GEOAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(21460, 1, 9, 24, 1250, 14, 301, 4) -- MP+25, Indi Duration + 15, Bell Skill + 5
    player:setCharVar("GEOAFweapon", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 21460)

  end

  --------------------------------------------------------
  --      RUN TRADE Sowilo Claymore 20781              --
  --------------------------------------------------------


  if (job == 22) and (trade:hasItemQty(20781, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(20781, 1, 76, 19) -- Dmg+52
    player:setCharVar("RUNAFweapon", 1)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 20781)

  end
  if (job == 22) and (trade:hasItemQty(20781, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getCharVar("RUNAFweapon") == 1) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(20781, 1, 76, 25, 796, 4) -- MP+10 Resist all Elements +2
    player:setCharVar("RUNAFweapon", 2)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 20781)

  end
  if (job == 22) and (trade:hasItemQty(20781, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getCharVar("RUNAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete()
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
    player:addItem(20781, 1, 76, 31, 796, 4, 1156,1) -- MP+10 Resist all Elements +2 Magic DMG taken -2
    player:setCharVar("RUNAFweapon", 3)
    player:messageSpecial(ID.text.ITEM_OBTAINED, 20781)

  end
    ---------------------------------
    --    Ele Staff                --
    ---------------------------------
        if (trade:hasItemQty(17545,1)) and (trade:hasItemQty(17547,1)) and (trade:hasItemQty(17549,1)) and (trade:hasItemQty(17551,1))
            and (trade:hasItemQty(17553,1)) and (trade:hasItemQty(17555,1)) and (trade:hasItemQty(17557,1)) and (trade:hasItemQty(17559,1)) and trade:getGil() == 50000 then
            player:tradeComplete()
            player:messageSpecial(ID.text.ITEM_OBTAINED, 18632)
            player:addItem(18632)
        elseif (trade:hasItemQty(17546,1)) and (trade:hasItemQty(17548,1)) and (trade:hasItemQty(17550,1)) and (trade:hasItemQty(17552,1))
            and (trade:hasItemQty(17554,1)) and (trade:hasItemQty(17556,1)) and (trade:hasItemQty(17558,1)) and (trade:hasItemQty(17560,1)) and trade:getGil() == 50000 then
            player:tradeComplete()
            player:messageSpecial(ID.text.ITEM_OBTAINED, 18633)
            player:addItem(18633)
        end
		  -----------------------------------
          --      Chatoyant/Iridal         --
          -----------------------------------
          
          -- Iridal Staff (18632)
          if (trade:hasItemQty(18632, 1) and trade:hasItemQty( 1126, 30 ) and level >= 51) then
		    player:tradeComplete()
            player:PrintToPlayer("Not Sure : Thank you for the requested items. Come see me again when you are ready for another upgrade.", 0xD)
            player:addItem(18632, 1, 45, 4)
            player:setCharVar("IridalUpgrade", 1)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 18632)
          
          elseif (trade:hasItemQty(18632, 1) and trade:hasItemQty( 1126, 50 ) and level >= 61 and (player:getCharVar("IridalUpgrade") == 1)) then
            -- Complete the trade..
            player:tradeComplete()
            player:PrintToPlayer("Not Sure : Thank you for the requested items. Come see me again when you are ready for the next stage.", 0xD)
            player:addItem(18632, 1, 45, 9)
            player:setCharVar("IridalUpgrade", 2)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 18632)
          
          elseif (trade:hasItemQty(18632, 1) and trade:hasItemQty( 1127, 50 ) and level >= 71 and (player:getCharVar("IridalUpgrade") == 2)) then
            -- Complete the trade..
            player:tradeComplete()
            player:PrintToPlayer("Not Sure : Thank you for the requested items. This is where we part ways for now.", 0xD)
            player:addItem(18632, 1, 45, 14, 353, 0)
            player:setCharVar("IridalUpgrade", 3)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 18632)
          elseif (trade:hasItemQty(18632, 1) and player:getCharVar("IridalUpgrade") < 1) then
            player:PrintToPlayer("Not Sure : I can upgrade your Idiral Staff if you bring me 30 Beastmen Seals.", 0xD)
          elseif (trade:hasItemQty(18632, 1) and player:getCharVar("IridalUpgrade") == 1) then
            player:PrintToPlayer("Not Sure : I can upgrade your Iridal Staff if you bring me 50 Beastmen Seals.", 0xD)
          elseif (trade:hasItemQty(18632, 1) and player:getCharVar("IridalUpgrade") == 2) then
            player:PrintToPlayer("Not Sure : I can upgrade your Iridal Staff if you bring me 50 Kindred Seals.", 0xD)
          end
          
          
          -- Chatoyant Staff (18633) 
          if (trade:hasItemQty(18633, 1) and trade:hasItemQty( 1126, 30 ) and level >= 51) then
            player:PrintToPlayer("Not Sure : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
			player:tradeComplete()
            player:addItem(18633, 1, 45, 4)
            player:setCharVar("ChatoyantUpgrade", 1)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 18633)
          
          elseif (trade:hasItemQty(18633, 1) and trade:hasItemQty( 1126, 50 ) and level >= 61 and (player:getCharVar("ChatoyantUpgrade") == 1)) then
            -- Complete the trade..
            player:tradeComplete()
            player:PrintToPlayer("Not Sure : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
            player:addItem(18633, 1, 45, 9)
            player:setCharVar("ChatoyantUpgrade", 2)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 18633)
          
          elseif (trade:hasItemQty(18633, 1) and trade:hasItemQty( 1127, 50 ) and level >= 71 and (player:getCharVar("ChatoyantUpgrade") == 2)) then
            -- Complete the trade..
            player:tradeComplete()
            player:PrintToPlayer("Not Sure : Thank you for the requested items. Come see me again when you are stronger.", 0xD)
            player:addItem(18633, 1, 45, 14, 353, 0)
            player:setCharVar("ChatoyantUpgrade", 3)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 18633)
          elseif (trade:hasItemQty(18633, 1) and player:getCharVar("ChatoyantUpgrade") < 1) then
            player:PrintToPlayer("Not Sure : I can upgrade your Chatoyant if you bring me 30 Beastmen Seals.", 0xD)
          elseif (trade:hasItemQty(18633, 1) and player:getCharVar("ChatoyantUpgrade") == 1) then
            player:PrintToPlayer("Not Sure : I can upgrade your Chatoyant if you bring me 50 Beastmen Seals.", 0xD)
          elseif (trade:hasItemQty(18633, 1) and player:getCharVar("ChatoyantUpgrade") == 2) then
            player:PrintToPlayer("Not Sure : I can upgrade your Chatoyant if you bring me 50 Kindred Seals.", 0xD)
          end
    end

  -----------------------------------
  -- onTrigger Action
  -----------------------------------

entity.onTrigger = function(player, npc)
    local job = player:getMainJob()
    local level = player:getMainLvl()

    if ((job == 1) and (player:getCharVar("WARAFweapon") == 3)) or
    ((job == 2) and (player:getCharVar("MNKAFweapon") == 3)) or
    ((job == 3) and (player:getCharVar("WHMAFweapon") == 3)) or
    ((job == 4) and (player:getCharVar("BLMAFweapon") == 3)) or
    ((job == 5) and (player:getCharVar("RDMAFweapon") == 3)) or
    ((job == 6) and (player:getCharVar("THFAFweapon") == 3)) or
    ((job == 7) and (player:getCharVar("PLDAFweapon") == 3)) or
    ((job == 7) and (player:getCharVar("PLDAFshield") == 3)) or
    ((job == 8) and (player:getCharVar("DRKAFweapon") == 3)) or
    ((job == 8) and (player:getCharVar("DRKAFweapongs") == 3)) or
    ((job == 9) and (player:getCharVar("BSTAFweapon") == 3)) or
    ((job == 10) and (player:getCharVar("BRDAFweapon") == 3)) or
    ((job == 10) and (player:getCharVar("BRDAFhorn") == 3)) or
    ((job == 10) and (player:getCharVar("BRDAFharp") == 3)) or
    ((job == 11) and (player:getCharVar("RNGAFweaponbow") == 3)) or
    ((job == 11) and (player:getCharVar("RNGAFweapongun") == 3)) or
    ((job == 12) and (player:getCharVar("SMNAFweapon") == 3)) or
    ((job == 13) and (player:getCharVar("NINAFweapon") == 3)) or
    ((job == 14) and (player:getCharVar("DRGAFweapon") == 3)) or
    ((job == 15) and (player:getCharVar("SAMAFweapon") == 3)) then
      player:PrintToPlayer("Oboro : I can't do anything else at the moment but you have two choices...Either talk", 0xD)
      player:PrintToPlayer("Oboro : to that Goblin over there or go to my friend Sadblyx in Nothern San d'Oria.", 0xD)

    elseif ((job == 16) and (player:getCharVar("BLUAFweapon") == 3)) or
      ((job == 17) and (player:getCharVar("CORAFweapon") == 3)) or
      ((job == 18) and (player:getCharVar("PUPAFweapon") == 3)) or
      ((job == 19) and (player:getCharVar("SCHAFweapon") == 3)) or
      ((job == 20) and (player:getCharVar("PUPAFweapon") == 3)) then
        player:PrintToPlayer("Oboro : You might want to go talk to my friend Sadblyx in Northern San d'Oria.  He might", 0xD)
        player:PrintToPlayer("Oboro : be able to do something else with that weapon.", 0xD)
      elseif ((job == 18) and (level >=47)) and (player:hasItem(18353) == false) then
        player:PrintToPlayer("Oboro : You are becoming a strong Puppetmaster.  I've made these new weapons, try them out.", 0xD)
        player:setCharVar("PUPAFweapon",1)
        if (player:getFreeSlotsCount() == 0) then
          player:PrintToPlayer("Oboro : Hey make some room in your inventory!", 0xD)
        elseif (player:getCharVar("PUPWeaponObtained") == 1) and (player:getCharVar("PUPAFweapon") == 0) and (player:hasItem(18353) == false) then
          player:PrintToPlayer("Oboro : You've lost those magnificent weapons already? Cough up 5,000 and I'll get you another!", 0xD)
        else
          player:addItem(18353, 1)
          player:setCharVar("PUPWeaponObtained",1)
          player:messageSpecial(ID.text.ITEM_OBTAINED, 18353)
        end

      elseif (player:hasItem(18214) or player:hasItem(17478) or player:hasItem(17422) or player:hasItem(17572) or player:hasItem(16829) or
        player:hasItem(16764) or player:hasItem(17643) or player:hasItem(12307) or player:hasItem(16978) or player:hasItem(16590) or
        player:hasItem(16680) or player:hasItem(16766) or player:hasItem(17352) or player:hasItem(17356) or player:hasItem(17188) or
        player:hasItem(17256) or player:hasItem(17218) or player:hasItem(17597) or player:hasItem(17771) or player:hasItem(17772) or
        player:hasItem(16877) or player:hasItem(17812) or player:hasItem(20781)) then

          player:PrintToPlayer("Oboro : Hey, I can upgrade that weapon for you. Bring me 15 Beastmen seals for the first", 0xD)
          player:PrintToPlayer("Oboro : upgrade, 30 beastmen seals for the second, and 15 Kindred seals for the last", 0xD)

        elseif ((job == 21) and player:hasItem(17478)) then
          player:PrintToPlayer("Oboro : Hey, I can upgrade that Matre Bell for you. Bring me 15 Beastmen seals for the first", 0xD)
          player:PrintToPlayer("Oboro : upgrade, 30 beastmen seals for the second, and 15 Kindred seals for the last", 0xD)
        else
          player:PrintToPlayer("Oboro : I'm busy!", 0xD)
        end
        end

return entity