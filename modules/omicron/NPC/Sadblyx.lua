-----------------------------------
-- Add some test NPCs to Northern_San_dOria (zone 210)
-----------------------------------
require("modules/module_utils")
require("scripts/zones/Northern_San_dOria/Zone")
-----------------------------------
local m = Module:new("Northern_San_dOria")

m:addOverride("xi.zones.Northern_San_dOria.Zone.onInitialize", function(zone)

    -- Call the zone's original function for onInitialize
    super(zone)

    -- Insert NPC into zone
    local Netblyx = zone:insertDynamicEntity({

        -- NPC or MOB
        objtype = xi.objType.NPC,
        name = "Sadblyx",
        look = 997,
        x = -121.991,
        y = 6.000,
        z = 178.133,
        rotation = 128,
        widescan = 1,
        onTrade = function(player, npc, trade)
            local balance = 0;
            local amount = 30000;
            local job = player:getMainJob();
            local pinfamy = player:getCurrency("infamy");
            local mainlvl = player:getMainLvl();
	        
            -- War Trade
	        
            if ((job == 1) and (player:getCharVar("WARAFweapon") == 3) and (trade:hasItemQty(18214,1)) and (trade:hasItemQty(2764,3))) then
              if (pinfamy >= amount) then
                player:delCurrency("infamy", amount);
                player:tradeComplete();
                player:PrintToPlayer("Sadblyx : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
                player:setCharVar("WARHAweapon",1);
                player:setCharVar("WARAFweapon",0);
                player:setCharVar("HA_Weapon_Wait", os.time());
              else
                balance = amount - pinfamy;
                player:PrintToPlayer("Sadblyx : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
              end
            elseif ((job == 1) and (player:getCharVar("WARAFweapon") == 3) and (mainlvl >= 75) and (player:getCharVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(18214,1))) then
              player:PrintToPlayer("Sadblyx : I will need 3x Dweomer Steel Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
            end
	        
            -- MNK Trade
            if ((job == 2) and (player:getCharVar("MNKAFweapon") == 3) and (trade:hasItemQty(17478,1)) and (trade:hasItemQty(2766,3))) then
              if (pinfamy >= amount) then
                player:delCurrency("infamy", amount);
                player:tradeComplete();
                player:PrintToPlayer("Sadblyx : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
                player:setCharVar("MNKHAweapon",1);
                player:setCharVar("MNKAFweapon",0);
                player:setCharVar("HA_Weapon_Wait", os.time());
              else
                balance = amount - pinfamy;
                player:PrintToPlayer("Sadblyx : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
              end
            elseif ((job == 2) and (player:getCharVar("MNKAFweapon") == 3) and (mainlvl >= 75) and (player:getCharVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17478,1))) then
              player:PrintToPlayer("Sadblyx : I will need 3x Oberon's Gold Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
            end
	        
            -- WHM Trade
            if ((job == 3) and (player:getCharVar("WHMAFweapon") == 3) and (trade:hasItemQty(17422,1)) and (trade:hasItemQty(2764,3))) then
              if (pinfamy >= amount) then
                player:delCurrency("infamy", amount);
                player:tradeComplete();
                player:PrintToPlayer("Sadblyx : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
                player:setCharVar("WHMHAweapon",1);
                player:setCharVar("WHMAFweapon",0);
                player:setCharVar("HA_Weapon_Wait", os.time());
              else
                balance = amount - pinfamy;
                player:PrintToPlayer("Sadblyx : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
              end
            elseif ((job == 3) and (player:getCharVar("WHMAFweapon") == 3) and (mainlvl >= 75) and (player:getCharVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17422,1))) then
              player:PrintToPlayer("Sadblyx : I will need 3x Dweomer Steel Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
            end
	        
            -- BLM Trade
            if ((job == 4) and (player:getCharVar("BLMAFweapon") == 3) and (trade:hasItemQty(17572,1)) and (trade:hasItemQty(2762,3))) then
              if (pinfamy >= amount) then
                player:delCurrency("infamy", amount);
                player:tradeComplete();
                player:PrintToPlayer("Sadblyx : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
                player:setCharVar("BLMHAweapon",1);
                player:setCharVar("BLMAFweapon",0);
                player:setCharVar("HA_Weapon_Wait", os.time());
              else
                balance = amount - pinfamy;
                player:PrintToPlayer("Sadblyx : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
              end
            elseif ((job == 4) and (player:getCharVar("BLMAFweapon") == 3) and (mainlvl >= 75) and (player:getCharVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17572,1))) then
              player:PrintToPlayer("Sadblyx : I will need 3x Feyweald Lumber and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
            end
	        
            -- RDM Trade
            if ((job == 5) and (player:getCharVar("RDMAFweapon") == 3) and (trade:hasItemQty(16829,1)) and (trade:hasItemQty(2766,3))) then
              if (pinfamy >= amount) then
                player:delCurrency("infamy", amount);
                player:tradeComplete();
                player:PrintToPlayer("Sadblyx : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
                player:setCharVar("RDMHAweapon",1);
                player:setCharVar("RDMAFweapon",0);
                player:setCharVar("HA_Weapon_Wait", os.time());
              else
                balance = amount - pinfamy;
                player:PrintToPlayer("Sadblyx : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
              end
            elseif ((job == 5) and (player:getCharVar("RDMAFweapon") == 3) and (mainlvl >= 75) and (player:getCharVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(16829,1))) then
              player:PrintToPlayer("Sadblyx : I will need 3x Oberon's Gold Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
            end
	        
            -- THF Trade
            if ((job == 6) and (player:getCharVar("THFAFweapon") == 3) and (trade:hasItemQty(16764,1)) and (trade:hasItemQty(2764,3))) then
              if (pinfamy >= amount) then
                player:delCurrency("infamy", amount);
                player:tradeComplete();
                player:PrintToPlayer("Sadblyx : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
                player:setCharVar("THFHAweapon",1);
                player:setCharVar("THFAFweapon",0);
                player:setCharVar("HA_Weapon_Wait", os.time());
              else
                balance = amount - pinfamy;
                player:PrintToPlayer("Sadblyx : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
              end
            elseif ((job == 6) and (player:getCharVar("THFAFweapon") == 3) and (mainlvl >= 75) and (player:getCharVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(16764,1))) then
              player:PrintToPlayer("Sadblyx : I will need 3x Dweomer Steel Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
            end
	        
            -- PLD Trade
            if ((job == 7) and (player:getCharVar("PLDAFweapon") == 3) and (trade:hasItemQty(17643,1)) and (trade:hasItemQty(2764,3))) then
              if (pinfamy >= amount) then
                player:delCurrency("infamy", amount);
                player:tradeComplete();
                player:PrintToPlayer("Sadblyx : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
                player:setCharVar("PLDHAweapon",1);
                player:setCharVar("PLDAFweapon",0);
                player:setCharVar("HA_Weapon_Wait", os.time());
              else
                balance = amount - pinfamy;
                player:PrintToPlayer("Sadblyx : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
              end
            elseif ((job == 7) and (player:getCharVar("PLDAFweapon") == 3) and (mainlvl >= 75) and (player:getCharVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17643,1))) then
              player:PrintToPlayer("Sadblyx : I will need 3x Dweomer Steel Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
            end
	        
            -- PLD Shield Trade
            if ((job == 7) and (player:getCharVar("PLDAFshield") == 3) and (trade:hasItemQty(12307,1)) and (trade:hasItemQty(2764,3))) then
              if (pinfamy >= amount) then
                player:delCurrency("infamy", amount);
                player:tradeComplete();
                player:PrintToPlayer("Sadblyx : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
                player:setCharVar("PLDHAshield",1);
                player:setCharVar("PLDAFshield",0);
                player:setCharVar("HA_Weapon_Wait", os.time());
              else
                balance = amount - pinfamy;
                player:PrintToPlayer("Sadblyx : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
              end
            elseif ((job == 7) and (player:getCharVar("PLDAFweapon") == 3) and (mainlvl >= 75) and (player:getCharVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17643,1))) then
              player:PrintToPlayer("Sadblyx : I will need 3x Dweomer Steel Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
            end
	        
	        
	        
            -- DRK Trade
            if ((job == 8) and (player:getCharVar("DRKAFweapon") == 3) and (trade:hasItemQty(16798,1)) and (trade:hasItemQty(2764,3))) then
              if (pinfamy >= amount) then
                player:delCurrency("infamy", amount);
                player:tradeComplete();
                player:PrintToPlayer("Sadblyx : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
                player:setCharVar("DRKHAweapon",1);
                player:setCharVar("DRKAFweapon",0);
                player:setCharVar("HA_Weapon_Wait", os.time());
              else
                balance = amount - pinfamy;
                player:PrintToPlayer("Sadblyx : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
              end
            elseif ((job == 8) and (player:getCharVar("DRKAFweapon") == 3) and (mainlvl >= 75) and (player:getCharVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(16798,1))) then
              player:PrintToPlayer("Sadblyx : I will need 3x Dweomer Steel Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
            end
	        
            -- BST Trade
            if ((job == 9) and (player:getCharVar("BSTAFweapon") == 3) and (trade:hasItemQty(16680,1)) and (trade:hasItemQty(2764,3))) then
              if (pinfamy >= amount) then
                player:delCurrency("infamy", amount);
                player:tradeComplete();
                player:PrintToPlayer("Sadblyx : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
                player:setCharVar("BSTHAweapon",1);
                player:setCharVar("BSTAFweapon",0);
                player:setCharVar("HA_Weapon_Wait", os.time());
              else
                balance = amount - pinfamy;
                player:PrintToPlayer("Sadblyx : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
              end
            elseif ((job == 9) and (player:getCharVar("BSTAFweapon") == 3) and (mainlvl >= 75) and (player:getCharVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(16680,1))) then
              player:PrintToPlayer("Sadblyx : I will need 3x Dweomer Steel Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
            end
	        
            -- BRD Trade
            if ((job == 10) and (player:getCharVar("BRDAFweapon") == 3) and (trade:hasItemQty(16766,1)) and (trade:hasItemQty(2764,3))) then
              if (pinfamy >= amount) then
                player:delCurrency("infamy", amount);
                player:tradeComplete();
                player:PrintToPlayer("Sadblyx : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
                player:setCharVar("BRDHAweapon",1);
                player:setCharVar("BRDAFweapon",0);
                player:setCharVar("HA_Weapon_Wait", os.time());
              else
                balance = amount - pinfamy;
                player:PrintToPlayer("Sadblyx : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
              end
            elseif ((job == 10) and (player:getCharVar("BRDAFweapon") == 3) and (mainlvl >= 75) and (player:getCharVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(16766,1))) then
              player:PrintToPlayer("Sadblyx : I will need 3x Dweomer Steel Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
            end
	        
            -- RNG Trade
            if ((job == 11) and (player:getCharVar("RNGAFweaponbow") == 3) and (trade:hasItemQty(17188,1)) and (trade:hasItemQty(2762,3))) then
              if (pinfamy >= amount) then
                player:delCurrency("infamy", amount);
                player:tradeComplete();
                player:PrintToPlayer("Sadblyx : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
                player:setCharVar("RNGHAweapon",1);
                player:setCharVar("RNGAFweapon",0);
                player:setCharVar("HA_Weapon_Wait", os.time());
              else
                balance = amount - pinfamy;
                player:PrintToPlayer("Sadblyx : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
              end
            elseif ((job == 11) and (player:getCharVar("RNGAFweaponbow") == 3) and (mainlvl >= 75) and (player:getCharVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17188,1))) then
              player:PrintToPlayer("Sadblyx : I will need 3x Feyweald Lumber and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
            end
	        
            -- SAM Trade
            if ((job == 12) and (player:getCharVar("SAMAFweapon") == 3) and (trade:hasItemQty(17812,1)) and (trade:hasItemQty(2764,3))) then
              if (pinfamy >= amount) then
                player:delCurrency("infamy", amount);
                player:tradeComplete();
                player:PrintToPlayer("Sadblyx : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
                player:setCharVar("SAMHAweapon",1);
                player:setCharVar("SAMAFweapon",0);
                player:setCharVar("HA_Weapon_Wait", os.time());
              else
                balance = amount - pinfamy;
                player:PrintToPlayer("Sadblyx : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
              end
            elseif ((job == 12) and (player:getCharVar("SAMAFweapon") == 3) and (mainlvl >= 75) and (player:getCharVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17812,1))) then
              player:PrintToPlayer("Sadblyx : I will need 3x Dweomer Steel Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
            end
	        
            -- NIN Trade
            if ((job == 13) and (player:getCharVar("NINAFweapon") == 3) and (trade:hasItemQty(17771,1)) and (trade:hasItemQty(2764,3))) then
              if (pinfamy >= amount) then
                player:delCurrency("infamy", amount);
                player:tradeComplete();
                player:PrintToPlayer("Sadblyx : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
                player:setCharVar("NINHAweapon",1);
                player:setCharVar("NINAFweapon",0);
                player:setCharVar("HA_Weapon_Wait", os.time());
              else
                balance = amount - pinfamy;
                player:PrintToPlayer("Sadblyx : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
              end
            elseif ((job == 13) and (player:getCharVar("NINAFweapon") == 3) and (mainlvl >= 75) and (player:getCharVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17771,1))) then
              player:PrintToPlayer("Sadblyx : I will need 3x Dweomer Steel Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
            end
	        
            -- DRG Trade
            if ((job == 14) and (player:getCharVar("DRGAFweapon") == 3) and (trade:hasItemQty(16887,1)) and (trade:hasItemQty(2762,3))) then
              if (pinfamy >= amount) then
                player:delCurrency("infamy", amount);
                player:tradeComplete();
                player:PrintToPlayer("Sadblyx : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
                player:setCharVar("DRGHAweapon",1);
                player:setCharVar("DRGAFweapon",0);
                player:setCharVar("HA_Weapon_Wait", os.time());
              else
                balance = amount - pinfamy;
                player:PrintToPlayer("Sadblyx : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
              end
            elseif ((job == 14) and (player:getCharVar("DRGAFweapon") == 3) and (mainlvl >= 75) and (player:getCharVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(16887,1))) then
              player:PrintToPlayer("Sadblyx : I will need 3x Feyweald Lumber and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
            end
	        
            -- SMN Trade
            if ((job == 15) and (player:getCharVar("SMNAFweapon") == 3) and (trade:hasItemQty(17597,1)) and (trade:hasItemQty(2762,3))) then
              if (pinfamy >= amount) then
                player:delCurrency("infamy", amount);
                player:tradeComplete();
                player:PrintToPlayer("Sadblyx : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
                player:setCharVar("SMNHAweapon",1);
                player:setCharVar("SMNAFweapon",0);
                player:setCharVar("HA_Weapon_Wait", os.time());
              else
                balance = amount - pinfamy;
                player:PrintToPlayer("Sadblyx : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
              end
            elseif ((job == 15) and (player:getCharVar("SMNAFweapon") == 3) and (mainlvl >= 75) and (player:getCharVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17597,1))) then
              player:PrintToPlayer("Sadblyx : I will need 3x Feyweald Lumber and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
            end
	        
            -- BLU Trade
            if ((job == 16) and (player:getCharVar("BLUAFweapon") == 3) and (trade:hasItemQty(17717,1)) and (trade:hasItemQty(2764,3))) then
              if (pinfamy >= amount) then
                player:delCurrency("infamy", amount);
                player:tradeComplete();
                player:PrintToPlayer("Sadblyx : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
                player:setCharVar("BLUHAweapon",1);
                player:setCharVar("BLUAFweapon",0);
                player:setCharVar("HA_Weapon_Wait", os.time());
              else
                balance = amount - pinfamy;
                player:PrintToPlayer("Sadblyx : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
              end
            elseif ((job == 16) and (player:getCharVar("BLUAFweapon") == 3) and (mainlvl >= 75) and (player:getCharVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17717,1))) then
              player:PrintToPlayer("Sadblyx : I will need 3x Dweomer Steel Ingot and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
            end
	        
            -- COR Trade
            if ((job == 17) and (player:getCharVar("CORAFweapon") == 3) and (trade:hasItemQty(18702,1)) and (trade:hasItemQty(2764,3))) then
              if (pinfamy >= amount) then
                player:delCurrency("infamy", amount);
                player:tradeComplete();
                player:PrintToPlayer("Sadblyx : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
                player:setCharVar("CORHAweapon",1);
                player:setCharVar("CORAFweapon",0);
                player:setCharVar("HA_Weapon_Wait", os.time());
              else
                balance = amount - pinfamy;
                player:PrintToPlayer("Sadblyx : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
              end
            elseif ((job == 17) and (player:getCharVar("CORAFweapon") == 3) and (mainlvl >= 75) and (player:getCharVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(18702,1))) then
              player:PrintToPlayer("Sadblyx : I will need 3x Dweomer Steel Ingot and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
            end
	        
	        
            -- PUP Trade
            if ((job == 18) and (player:getCharVar("PUPAFweapon") == 3) and (trade:hasItemQty(18353,1)) and (trade:hasItemQty(2766,3))) then
              if (pinfamy >= amount) then
                player:delCurrency("infamy", amount);
                player:tradeComplete();
                player:PrintToPlayer("Sadblyx : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
                player:setCharVar("PUPHAweapon",1);
                player:setCharVar("PUPAFweapon",0);
                player:setCharVar("HA_Weapon_Wait", os.time());
              else
                balance = amount - pinfamy;
                player:PrintToPlayer("Sadblyx : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
              end
            elseif ((job == 18) and (player:getCharVar("PUPAFweapon") == 3) and (mainlvl >= 75) and (player:getCharVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(18353,1))) then
              player:PrintToPlayer("Sadblyx : I will need 3x Oberon's Gold Ingot and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
            end
	        
	        
            -- DNC Trade
            if ((job == 19) and (player:getCharVar("DNCAFweapon") == 3) and (trade:hasItemQty(16467,1)) and (trade:hasItemQty(2769,3))) then
              if (pinfamy >= amount) then
                player:delCurrency("infamy", amount);
                player:tradeComplete();
                player:PrintToPlayer("Sadblyx : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
                player:setCharVar("DNCHAweapon",1);
                player:setCharVar("DNCAFweapon",0);
                player:setCharVar("HA_Weapon_Wait", os.time());
              else
                balance = amount - pinfamy;
                player:PrintToPlayer("Sadblyx : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
              end
            elseif ((job == 19) and (player:getCharVar("DNCAFweapon") == 3) and (mainlvl >= 75) and (player:getCharVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17098,1))) then
              player:PrintToPlayer("Sadblyx : I will need 3x Buggane Horns and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
            end
	        
            -- SCH Trade
            if ((job == 20) and (player:getCharVar("SCHAFweapon") == 3) and (trade:hasItemQty(17098,1)) and (trade:hasItemQty(2762,3))) then
              if (pinfamy >= amount) then
                player:delCurrency("infamy", amount);
                player:tradeComplete();
                player:PrintToPlayer("Sadblyx : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
                player:setCharVar("SCHHAweapon",1);
                player:setCharVar("SCHAFweapon",0);
                player:setCharVar("HA_Weapon_Wait", os.time());
              else
                balance = amount - pinfamy;
                player:PrintToPlayer("Sadblyx : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
              end
            elseif ((job == 20) and (player:getCharVar("SCHAFweapon") == 3) and (mainlvl >= 75) and (player:getCharVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17098,1))) then
              player:PrintToPlayer("Sadblyx : I will need 3x Feyewald Lumber and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
            end
	        
            -- GEO Trade
             if ((job == 21) and (player:getCharVar("GEOAFweapon") == 3) and (trade:hasItemQty(21460,1)) and (trade:hasItemQty(2766,3))) then
              if (pinfamy >= amount) then
                player:delCurrency("infamy", amount);
                player:tradeComplete();
                player:PrintToPlayer("Sadblyx : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
                player:setCharVar("GEOHAweapon",1);
                player:setCharVar("GEOAFweapon",0);
                player:setCharVar("HA_Weapon_Wait", os.time());
              else
                balance = amount - pinfamy;
                player:PrintToPlayer("Sadblyx : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
              end
            elseif ((job == 21) and (player:getCharVar("GEOAFweapon") == 3) and (mainlvl >= 75) and (player:getCharVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(21460,1))) then
              player:PrintToPlayer("Sadblyx : I will need 3x Oberon's Gold and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
            end
	        
            -- RUN Trade
             if ((job == 22) and (player:getCharVar("RUNAFweapon") == 3) and (trade:hasItemQty(20781,1)) and (trade:hasItemQty(2764,3))) then
              if (pinfamy >= amount) then
                player:delCurrency("infamy", amount);
                player:tradeComplete();
                player:PrintToPlayer("Sadblyx : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
                player:setCharVar("RUNHAweapon",1);
                player:setCharVar("RUNAFweapon",0);
                player:setCharVar("HA_Weapon_Wait", os.time());
              else
                balance = amount - pinfamy;
                player:PrintToPlayer("Sadblyx : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
              end
            elseif ((job == 22) and (player:getCharVar("RUNAFweapon") == 3) and (mainlvl >= 75) and (player:getCharVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(20781,1))) then
              player:PrintToPlayer("Sadblyx : I will need 3x Dweomer Steel and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
            end
        end,

        onTrigger = function(player, npc)
        local daywait = player:getCharVar("HA_Weapon_Wait") + 600;
        if (daywait > os.time()) then
          player:PrintToPlayer("Sadblyx : Please have patience.  The purification takes time to get right.", 0xD);
        end       
	    
		-- WAR
        if ((player:getCharVar("WARHAWeapon") == 1) and (daywait < os.time())) then
          player:PrintToPlayer("Sadblyx : Now your weapon is mostly ready.", 0xD);
          player:addItem(18505, 1, 2047, 0, 2047, 0 , 2047, 0);
          player:setCharVar("HA_Weapon_Wait", 0);
          player:setCharVar("WARHAWeapon", 2);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 18505);
          -- MNK
        elseif ((player:getCharVar("MNKHAWeapon") == 1) and (daywait < os.time())) then
          player:PrintToPlayer("Sadblyx : Now your weapon is mostly ready.", 0xD);
          player:addItem(18764, 1, 2047, 0, 2047, 0 , 2047, 0);
          player:setCharVar("HA_Weapon_Wait", 0);
          player:setCharVar("MNKHAWeapon", 2);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 18764);
          -- WHM
        elseif ((player:getCharVar("WHMHAWeapon") == 1) and (daywait < os.time())) then
          player:PrintToPlayer("Sadblyx : Now your weapon is mostly ready.", 0xD);
          player:addItem(18870, 1, 2047, 0, 2047, 0 , 2047, 0);
          player:setCharVar("HA_Weapon_Wait", 0);
          player:setCharVar("WHMHAWeapon", 2);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 18870);
          -- BLM
        elseif ((player:getCharVar("BLMHAWeapon") == 1) and (daywait < os.time())) then
          player:PrintToPlayer("Sadblyx : Now your weapon is mostly ready.", 0xD);
          player:addItem(18589, 1, 2047, 0, 2047, 0 , 2047, 0);
          player:setCharVar("HA_Weapon_Wait", 0);
          player:setCharVar("BLMHAWeapon", 2);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 18589);
          -- RDM
        elseif ((player:getCharVar("RDMHAWeapon") == 1) and (daywait < os.time())) then
          player:PrintToPlayer("Sadblyx : Now your weapon is mostly ready.", 0xD);
          player:addItem(17761, 1, 2047, 0, 2047, 0 , 2047, 0);
          player:setCharVar("HA_Weapon_Wait", 0);
          player:setCharVar("RDMHAWeapon", 2);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 17761);
          -- THF
        elseif ((player:getCharVar("THFHAWeapon") == 1) and (daywait < os.time())) then
          player:PrintToPlayer("Sadblyx : Now your weapon is mostly ready.", 0xD);
          player:addItem(19115, 1, 2047, 0, 2047, 0 , 2047, 0);
          player:setCharVar("HA_Weapon_Wait", 0);
          player:setCharVar("THFHAWeapon", 2);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 19115);
          -- PLD
        elseif ((player:getCharVar("PLDHAWeapon") == 1) and (daywait < os.time())) then
          player:PrintToPlayer("Sadblyx : Now your weapon is mostly ready.", 0xD);
          player:addItem(17762, 1, 2047, 0, 2047, 0 , 2047, 0);
          player:setCharVar("HA_Weapon_Wait", 0);
          player:setCharVar("PLDHAWeapon", 2);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 17762);
          -- PLD Shield
        elseif ((player:getCharVar("PLDHAshield") == 1) and (daywait < os.time())) then
          player:PrintToPlayer("Sadblyx : Now your shield is mostly ready.", 0xD);
          player:addItem(12307, 1, 2047, 0, 2047, 0 , 2047, 0);
          player:setCharVar("HA_Weapon_Wait", 0);
          player:setCharVar("PLDHAshield", 2);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 17762);
          -- DRK
        elseif ((player:getCharVar("DRKHAWeapon") == 1) and (daywait < os.time())) then
          player:PrintToPlayer("Sadblyx : Now your weapon is mostly ready.", 0xD);
          player:addItem(18995, 1, 2047, 0, 2047, 0 , 2047, 0);
          player:setCharVar("HA_Weapon_Wait", 0);
          player:setCharVar("DRKHAWeapon", 2);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 18995);
          -- BST
        elseif ((player:getCharVar("BSTHAWeapon") == 1) and (daywait < os.time())) then
          player:PrintToPlayer("Sadblyx : Now your weapon is mostly ready.", 0xD);
          player:addItem(17966, 1, 2047, 0, 2047, 0 , 2047, 0);
          player:setCharVar("HA_Weapon_Wait", 0);
          player:setCharVar("BSTHAWeapon", 2);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 17966);
          -- BRD
        elseif ((player:getCharVar("BRDHAWeapon") == 1) and (daywait < os.time())) then
          player:PrintToPlayer("Sadblyx : Now your weapon is mostly ready.", 0xD);
          player:addItem(19116, 1, 2047, 0, 2047, 0 , 2047, 0);
          player:setCharVar("HA_Weapon_Wait", 0);
          player:setCharVar("BRDHAWeapon", 2);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 19116);
          -- RNG
        elseif ((player:getCharVar("RNGHAWeapon") == 1) and (daywait < os.time())) then
          player:PrintToPlayer("Sadblyx : Now your weapon is mostly ready.", 0xD);
          player:addItem(18763, 1, 2047, 0, 2047, 0 , 2047, 0);
          player:setCharVar("HA_Weapon_Wait", 0);
          player:setCharVar("RNGHAWeapon", 2);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 18763);
          -- SAM
        elseif ((player:getCharVar("SAMHAWeapon") == 1) and (daywait < os.time())) then
          player:PrintToPlayer("Sadblyx : Now your weapon is mostly ready.", 0xD);
          player:addItem(18452, 1, 2047, 0, 2047, 0 , 2047, 0);
          player:setCharVar("HA_Weapon_Wait", 0);
          player:setCharVar("SAMHAWeapon", 2);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 18452);
          -- NIN
        elseif ((player:getCharVar("NINHAWeapon") == 1) and (daywait < os.time())) then
          player:PrintToPlayer("Sadblyx : Now your weapon is mostly ready.", 0xD);
          player:addItem(19275, 1, 2047, 0, 2047, 0 , 2047, 0);
          player:setCharVar("HA_Weapon_Wait", 0);
          player:setCharVar("NINHAWeapon", 2);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 19275);
          -- DRG
        elseif ((player:getCharVar("DRGHAWeapon") == 1) and (daywait < os.time())) then
          player:PrintToPlayer("Sadblyx : Now your weapon is mostly ready.", 0xD);
          player:addItem(19303, 1, 2047, 0, 2047, 0 , 2047, 0);
          player:setCharVar("HA_Weapon_Wait", 0);
          player:setCharVar("DRGHAWeapon", 2);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 19303);
          -- SMN
        elseif ((player:getCharVar("SMNHAWeapon") == 1) and (daywait < os.time())) then
          player:PrintToPlayer("Sadblyx : Now your weapon is mostly ready.", 0xD);
          player:addItem(18601, 1, 2047, 0, 2047, 0 , 2047, 0);
          player:setCharVar("HA_Weapon_Wait", 0);
          player:setCharVar("SMNHAWeapon", 2);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 18601);
          -- BLU
        elseif ((player:getCharVar("BLUHAWeapon") == 1) and (daywait < os.time())) then
          player:PrintToPlayer("Sadblyx : Now your weapon is mostly ready.", 0xD);
          player:addItem(17763, 1, 2047, 0, 2047, 0 , 2047, 0);
          player:setCharVar("HA_Weapon_Wait", 0);
          player:setCharVar("BLUHAWeapon", 2);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 17763);
          -- COR
        elseif ((player:getCharVar("CORHAWeapon") == 1) and (daywait < os.time())) then
          player:PrintToPlayer("Sadblyx : Now your weapon is mostly ready.", 0xD);
          player:addItem(18737, 1, 2047, 0, 2047, 0 , 2047, 0);
          player:setCharVar("HA_Weapon_Wait", 0);
          player:setCharVar("CORHAWeapon", 2);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 18737);
          -- PUP
        elseif ((player:getCharVar("PUPHAWeapon") == 1) and (daywait < os.time())) then
          player:PrintToPlayer("Sadblyx : Now your weapon is mostly ready.", 0xD);
          player:addItem(18765, 1, 2047, 0, 2047, 0 , 2047, 0);
          player:setCharVar("HA_Weapon_Wait", 0);
          player:setCharVar("PUPHAWeapon", 2);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 18765);
          -- DNC
        elseif ((player:getCharVar("DNCHAWeapon") == 1) and (daywait < os.time())) then
          player:PrintToPlayer("Sadblyx : Now your weapon is mostly ready.", 0xD);
          player:addItem(19117, 1, 2047, 0, 2047, 0 , 2047, 0);
          player:setCharVar("HA_Weapon_Wait", 0);
          player:setCharVar("DNCHAWeapon", 2);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 19117);
          -- SCH
        elseif ((player:getCharVar("SCHHAWeapon") == 1) and (daywait < os.time())) then
          player:PrintToPlayer("Sadblyx : Now your weapon is mostly ready.", 0xD);
          player:addItem(18602, 1, 2047, 0, 2047, 0 , 2047, 0);
          player:setCharVar("HA_Weapon_Wait", 0);
          player:setCharVar("SCHHAWeapon", 2);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 18602);
          -- GEO
        elseif ((player:getCharVar("GEOHAWeapon") == 1) and (daywait < os.time())) then
          player:PrintToPlayer("Sadblyx : Now your bell is mostly ready.", 0xD);
          player:addItem(21460, 1, 2047, 0, 2047, 0 , 2047, 0);
          player:setCharVar("HA_Weapon_Wait", 0);
          player:setCharVar("GEOHAWeapon", 2);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 21460);
        elseif ((player:getCharVar("RUNHAWeapon") == 1) and (daywait < os.time())) then
          player:PrintToPlayer("Sadblyx : Now your weapon is mostly ready.", 0xD);
          player:addItem(20781, 1, 2047, 0, 2047, 0 , 2047, 0);
          player:setCharVar("HA_Weapon_Wait", 0);
          player:setCharVar("RUNHAWeapon", 2);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 20781);
        elseif ((player:getCharVar("WARHAweapon") == 2) or (player:getCharVar("MNKHAweapon") == 2) or (player:getCharVar("WHMHAweapon") == 2) or (player:getCharVar("BLMHAweapon") == 2)
          or (player:getCharVar("RDMHAweapon") == 2) or (player:getCharVar("THFHAweapon") == 2) or (player:getCharVar("PLDHAweapon") == 2) or (player:getCharVar("DRKHAweapon") == 2)
          or (player:getCharVar("BSTHAweapon") == 2) or (player:getCharVar("BRDHAweapon") == 2) or (player:getCharVar("RNGHAweapon") == 2) or (player:getCharVar("SAMHAweapon") == 2)
          or (player:getCharVar("NINHAweapon") == 2) or (player:getCharVar("DRGHAweapon") == 2) or (player:getCharVar("SMNHAweapon") == 2) or (player:getCharVar("BLUHAweapon") == 2)
          or (player:getCharVar("CORHAweapon") == 2) or (player:getCharVar("PUPHAweapon") == 2) or (player:getCharVar("SCHHAweapon") == 2) or (player:getCharVar("DNCHAweapon") == 2)
          or (player:getCharVar("DNCHAshield") == 2) or (player:getCharVar("GEOHAweapon") == 2) or (player:getCharVar("RUNHAweapon") == 2)) then
            player:PrintToPlayer("Sadblyx : To finish the Ceremony, bury your weapon near the beach in Purgonorgo Isle to absorb the Malice there.  It should draw ", 0xD);
            player:PrintToPlayer("Sadblyx : out the negative energy your Artifact Weapon once had and allow it to manifest itself.", 0xD);
        elseif ((player:getCharVar("WARAFweapon") == 3) or (player:getCharVar("MNKAFweapon") == 3) or (player:getCharVar("WHMAFweapon") == 3) or (player:getCharVar("BLMAFweapon") == 3) or
            (player:getCharVar("RDMAFweapon") == 3) or (player:getCharVar("THFAFweapon") == 3) or (player:getCharVar("PLDAFweapon") == 3) or (player:getCharVar("DRKAFweapon") == 3) or
            (player:getCharVar("BSTAFweapon") == 3) or (player:getCharVar("BRDAFweapon") == 3) or (player:getCharVar("RNGAFweaponbow") == 3) or (player:getCharVar("SAMAFweapon") == 3) or
            (player:getCharVar("NINAFweapon") == 3) or (player:getCharVar("DRGAFweapon") == 3) or (player:getCharVar("SMNAFweapon") == 3) or (player:getCharVar("BLUAFweapon") == 3) or
            (player:getCharVar("CORAFweapon") == 3) or (player:getCharVar("PUPAFweapon") == 3) or (player:getCharVar("SCHAFweapon") == 3) or (player:getCharVar("DNCAFweapon") == 3) or
            (player:getCharVar("PLDAFshield") == 3) or (player:getCharVar("RUNAFweapon") == 3)) then
              player:PrintToPlayer("Sadblyx : Looks like Oboro is at it again...If you want a real weapon, trade me your Artifact so I can examine it.", 0xD);
              player:setCharVar("HA_Weapon_Start",1);
        elseif (player:getCharVar("GEOAFweapon") == 3) then
            player:PrintToPlayer("Sadblyx : Oboro is still crafting subpar items I see...trade your Bell to me so I can examine it", 0xD);
            player:setCharVar("HA_Weapon_Start",1);
        else
            player:startEvent(6);
        end
		end,
    })

    utils.unused(Netblyx)

end)

return m
