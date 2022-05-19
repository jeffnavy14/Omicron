require("modules/module_utils")

local m = Module:new("reforged")

m:addOverride("xi.zone.Port_Jeuno.npcs.Monisette.onTrigger", function(player, npc)
    local ID = require("scripts/zones/Port_Jeuno/IDs")
	-- DEFAULT DIALOG (menu)
       player:startEvent(385)
end)

m:addOverride("xi.zone.Port_Jeuno.npcs.Monisette.onTrigger", function(player, npc, trade)
local ID = require("scripts/zones/Port_Jeuno/IDs")
local afArmorReforged = xi.monisette.afArmorReforged
local relicArmorReforged = xi.monisette.relicArmorReforged
local empyArmorReforged = xi.monisette.empyArmorReforged

        local tradedCombo = 0
		-- TO DO Trade Storage for Rem Chapters
		--- EXAMPLE ---
		--[[ store ancient beastcoins
    if trade:hasItemQty(1875, count) then
        local total = player:getCurrency("ancient_beastcoin") + count

        if total < 9999 then -- store max 9999 ancient beastcoins
            player:addCurrency("ancient_beastcoin", count)
            player:tradeComplete()
            player:startEvent(311, count, 0, 0, 0, 0, 0, 0, total)
        else
            player:messageSpecial(ID.text.SAGHEERA_MAX_ABCS)
        end
		--]]
		
		
		-- check for af upgrade trades
		if tradedCombo == 0 then
            for k, v in pairs(afArmorReforged) do
                if npcUtil.tradeHasExactly(trade, v.trade) then
                    tradedCombo = k
                break
            end
        end
        -- check for relic upgrade trades
        if tradedCombo == 0 then
            for k, v in pairs(relicArmorReforged) do
                if npcUtil.tradeHasExactly(trade, v.trade) then
                    tradedCombo = k
                    break
                end
            end
		end
		-- check for Empyerian Upgrade Trades
		if tradedCombo == 0 then
            for k, v in pairs(empyArmorReforged) do
                if npcUtil.tradeHasExactly(trade, v.trade) then
                    tradedCombo = k
                    break
				end
			end
		end

        -- found a match
        if tradedCombo > 0 then

            player:confirmTrade()
            player:setCharVar("AFRupgrade", tradedCombo)
		--	player:setCharVar("AFRupgradeDay", getVanaMidnight()) -- Current time + Remaining minutes in the hour in seconds (Day Change)
            player:startEvent(388)
        end
    end
end)

m:addOverride("xi.zone.Port_Jeuno.npcs.Monisette.onEventFinish", function(player, csid, option)
local ID = require("scripts/zones/Port_Jeuno/IDs")
local afArmorReforged = xi.monisette.afArmorReforged
local relicArmorReforged = xi.monisette.relicArmorReforged
local empyArmorReforged = xi.monisette.empyArmorReforged
		if csid == 388 then
        local afrUpgrade = player:getCharVar("AFRupgrade")
        local info = afArmorReforged[afrUpgrade]
        if info == nil then
            info = relicArmorPlusOne[afrUpgrade]
        end
		if info == nil then
            info = empyArmorPlusOne[afrUpgrade]
        end

        -- found a valid reward
        if info and npcUtil.giveItem(player, info.reward) then
			player:startEvent(386)
            player:setCharVar("AFRupgrade", 0)
		 -- player:setCharVar("AFRupgradeDay", 0)
		end
    end
end)

return m