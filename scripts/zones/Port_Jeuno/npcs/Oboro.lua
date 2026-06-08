-----------------------------------
-- Area: Port Jeuno
--  NPC: Oboro
-----------------------------------
require("scripts/globals/remaweapons")
---@type TNpcEntity
local entity = {}

local jseWeapons =
{
    [1] = { trade = { xi.item.CEHUETZI_PELT, xi.item.MYTHIC_POLE, xi.item.DARK_STAFF }, reward = xi.item.KALADANDA },
    [2] = { trade = { xi.item.CEHUETZI_CLAW, xi.item.ADAMAN_KILIJ, xi.item.SHOTEL }, reward = xi.item.MIMESIS },
    [3] = { trade = { xi.item.CEHUETZI_PELT, xi.item.SHOFAR, xi.item.EBONY_HARP }, reward = xi.item.TERPANDER },
    [4] = { trade = { xi.item.CEHUETZI_CLAW, xi.item.TABARZIN, xi.item.DARKSTEEL_PICK }, reward = xi.item.ARKTOI },
    [5] = { trade = { xi.item.CEHUETZI_PELT, xi.item.HEXAGUN, xi.item.MATCHLOCK_GUN }, reward = xi.item.DEATHLOCKE },
    [6] = { trade = { xi.item.CEHUETZI_CLAW, xi.item.JAMBIYA, xi.item.DARKSTEEL_KUKRI }, reward = xi.item.POLYHYMNIA },
    [7] = { trade = { xi.item.CEHUETZI_CLAW, xi.item.ORICHALCUM_LANCE, xi.item.DARK_MEZRAQ }, reward = xi.item.AREADBHAR },
    [8] = { trade = { xi.item.CEHUETZI_CLAW, xi.item.ORICHALCUM_SCYTHE, xi.item.IVORY_SICKLE }, reward = xi.item.CRONUS },
    [9] = { trade = { xi.item.CEHUETZI_PELT, xi.item.IMPERIAL_WOOTZ_INGOT, xi.item.STAR_SAPPHIRE }, reward = xi.item.DUNNA },
    [10] = { trade = { xi.item.CEHUETZI_PELT, xi.item.KOENIGS_KNUCKLES, xi.item.BONE_PATAS }, reward = xi.item.NYEPEL },
    [11] = { trade = { xi.item.CEHUETZI_CLAW, xi.item.HIRENJAKU, xi.item.MUKETSU }, reward = xi.item.SHIGI },
    [12] = { trade = { xi.item.CEHUETZI_PELT, xi.item.JANUWIYAH, xi.item.DARKSTEEL_SHIELD }, reward = xi.item.PRIWEN },
    [13] = { trade = { xi.item.CEHUETZI_PELT, xi.item.ADAMAN_SAINTI, xi.item.DARKSTEEL_CLAWS }, reward = xi.item.OHTAS },
    [14] = { trade = { xi.item.CEHUETZI_CLAW, xi.item.ANELACE, xi.item.SCHLAEGER }, reward = xi.item.EGEKING },
    [15] = { trade = { xi.item.CEHUETZI_PELT, xi.item.HELLFIRE, xi.item.MATCHLOCK_GUN }, reward = xi.item.LIONSQUALL },
    [16] = { trade = { xi.item.CEHUETZI_CLAW, xi.item.NAGAN, xi.item.ZWEIHANDER }, reward = xi.item.AETTIR },
    [17] = { trade = { xi.item.CEHUETZI_CLAW, xi.item.BUTACHI, xi.item.JINDACHI }, reward = xi.item.KURIKARANOTACHI },
    [18] = { trade = { xi.item.CEHUETZI_PELT, xi.item.MAHOGANY_POLE, xi.item.ICE_STAFF }, reward = xi.item.COEUS },
    [19] = { trade = { xi.item.CEHUETZI_PELT, xi.item.MAHOGANY_STAFF, xi.item.LIGHT_STAFF }, reward = xi.item.GRIDARVOR },
    [20] = { trade = { xi.item.CEHUETZI_CLAW, xi.item.MISERICORDE, xi.item.DARKSTEEL_KNIFE }, reward = xi.item.SANDUNG },
    [21] = { trade = { xi.item.CEHUETZI_CLAW, xi.item.TOPOROK, xi.item.DARKSTEEL_VOULGE }, reward = xi.item.MINOS },
    [22] = { trade = { xi.item.CEHUETZI_PELT, xi.item.DARKSTEEL_MAUL, xi.item.DARKSTEEL_MACE }, reward = xi.item.SINDRI },
}

-- Step 1 Upgrade Mapping
-- Structure: [BaseID] = { upgrade = ResultID, material = MaterialID, qty = RequiredQty, step = 1 or 2 }
local upgradeMap = {}

local function populateMap(idTable, materialId, startIdx)
    for _, ids in pairs(idTable) do
        local i6, i7, i8, i9, i10
        if startIdx == 1 then -- Ergon
            i6, i8, i9, i10 = ids[1], ids[2], ids[3], ids[4] -- Ergons have a unique table layout
        else
            i6, i7, i8, i9, i10 = ids[startIdx], ids[startIdx + 1], ids[startIdx + 2], ids[startIdx + 3], ids[startIdx + 4]
        end

        -- Index 6: 99 I -> Index 8: 119 I
        if i6 and i8 then
            if startIdx == 1 then
                -- Ergon weapons start at Step 2 (119 -> 119 II) requiring 10,000 materials.
                upgradeMap[i6] = { upgrade = i8, material = materialId, qty = 10000, step = 2 }
            else
                upgradeMap[i6] = { upgrade = i8, material = materialId, qty = 300, step = 1 }
            end
        end

        -- Index 7: 99 II (Afterglow) -> Index 9: 119 II (Afterglow)
        if i7 and i9 then
            upgradeMap[i7] = { upgrade = i9, material = materialId, qty = 300, step = 1 }
        end

        -- Step 2: iLevel 119 -> 119 III
        if i8 and i10 then
            upgradeMap[i8] = { upgrade = i10, material = materialId, qty = 10000, step = 2 }
        end

        if i9 and i10 then
            upgradeMap[i9] = { upgrade = i10, material = materialId, qty = 1, step = 2 }
        end
    end
end

populateMap(xi.remaWeapons.relicIDs, xi.item.PLUTON, 6)
populateMap(xi.remaWeapons.mythicIDs, xi.item.BEITETSU, 6)
populateMap(xi.remaWeapons.empyreanIDs, xi.item.RIFTBORN_BOULDER, 4)
populateMap(xi.remaWeapons.ergonIDs, xi.item.BEITETSU, 1)

local function getUpgradeData(itemId)
    return upgradeMap[itemId]
end

entity.onTrade = function(player, npc, trade)
    if player:getCharVar("[Oboro]UpgradeWeapon") > 0 then
        player:printToPlayer("I can only work on one masterpiece at a time. Finish your current project or abandon it before starting another.", 0, "Oboro")
        return
    end

    -- Check for JSE Weapon construction (Job-Specific 119 weapons)
    for _, v in pairs(jseWeapons) do
        for _, materialId in ipairs({ xi.item.PLUTON, xi.item.BEITETSU, xi.item.RIFTBORN_BOULDER }) do
            local fullTrade = { { materialId, 150 } }
            for _, itemId in ipairs(v.trade) do
                table.insert(fullTrade, { itemId, 1 })
            end

            if npcUtil.tradeHasExactly(trade, fullTrade) then
                if npcUtil.giveItem(player, v.reward) then
                    player:tradeComplete()
                    player:printToPlayer("This is a fine piece of work. Take it, and may it serve you well.", 0, "Oboro")
                    return
                end
            end
        end
    end

    local remaId = 0

    -- Find the REMA weapon in the trade
    for i = 0, trade:getSlotCount() - 1 do
        local id = trade:getItemId(i)
        if upgradeMap[id] then
            remaId = id
            break
        end
    end

    local weaponRegistered = player:getCharVar("[Oboro]WeaponRegistered")
    if remaId == 0 and weaponRegistered == 0 then
        return
    end

    local upgradeData      = getUpgradeData(remaId)
    local equipCheck       = player:getCharVar("[Oboro]EquipCheck")
    local materialCount    = player:getCharVar("[Oboro]MaterialCount")

    -- Use registered weapon data if we are doing a materials-only trade
    local activeData       = remaId > 0 and upgradeData or getUpgradeData(weaponRegistered)
    local matsInTrade      = activeData and trade:getItemQty(activeData.material) or 0
    local totalTradeQty    = trade:getItemCount()

    -- Scenario: Trading just the weapon (Inspection Phase)
    if totalTradeQty == 1 and remaId > 0 and remaId == equipCheck and (weaponRegistered ~= remaId or materialCount < activeData.qty) then
        -- Requirement Check for Step 2
        if upgradeData.step == 2 and not player:hasKeyItem(xi.ki.SCINTILLATING_RHAPSODY) then
            player:printToPlayer("I sense great potential in this weapon, but you do not yet possess the knowledge to unlock it. Speak to me again when you have finished your journey with the Rhapsodies.", 0, "Oboro")
            return
        end

        -- Oboro inspects it and trades it back
        player:printToPlayer("This is indeed a fine weapon. If you bring it to me along with " .. upgradeData.qty .. " of the proper materials, I can strengthen it further. Progress: " .. materialCount .. " / " .. upgradeData.qty, 0, "Oboro")
        player:setCharVar("[Oboro]WeaponRegistered", remaId)
        return
    end

    -- Scenario: Incremental feeding (Materials only)
    if weaponRegistered > 0 and remaId == 0 and matsInTrade > 0 and totalTradeQty == matsInTrade then
        local currentData = getUpgradeData(weaponRegistered)
        local needed      = currentData.qty - materialCount

        if totalTradeQty > needed then
            player:printToPlayer("That is more than I require. I only need " .. needed .. " more.", 0, "Oboro")
            return
        end

        -- player:tradeComplete() -- Already changed in previous diff
        local newTotal = materialCount + totalTradeQty
        player:setCharVar("[Oboro]MaterialCount", newTotal)

        if newTotal >= currentData.qty then
            player:printToPlayer("I have everything I need (" .. newTotal .. " / " .. currentData.qty .. "). Now, hand me the weapon once more and I shall begin.", 0, "Oboro")
            player:tradeComplete()
        else
            player:printToPlayer("I have received the materials. Progress: " .. newTotal .. " / " .. currentData.qty .. ". I require " .. (currentData.qty - newTotal) .. " more to begin.", 0, "Oboro")
            player:tradeComplete()
        end
        return
    end

    -- Scenario: Finalizing the project (Weapon + optional remaining materials)
    if remaId > 0 and remaId == weaponRegistered then
        upgradeData = activeData
        local neededStones = upgradeData.qty - materialCount
        local tradeValid   = false

        if neededStones <= 0 then
            tradeValid = totalTradeQty == 1 -- Just the weapon
        elseif neededStones <= 792 then -- Remaining amount fits in a single trade window (8 slots * 99)
            tradeValid = npcUtil.tradeHasExactly(trade, { { remaId, 1 }, { upgradeData.material, neededStones } })
        end

        if tradeValid then
            player:tradeComplete()
            player:setCharVar("[Oboro]BaseWeapon", remaId)
            player:setCharVar("[Oboro]UpgradeWeapon", upgradeData.upgrade)
            player:setCharVar("[Oboro]UpgradeMidnight", getVanaMidnight())
            player:setCharVar("[Oboro]MaterialCount", 0)
            player:setCharVar("[Oboro]EquipCheck", 0)
            player:setCharVar("[Oboro]WeaponRegistered", 0)

            player:printToPlayer("I shall begin at once. Come back and see me after an in-game day has passed.", 0, "Oboro")
            return
        else
            -- If the final trade is invalid, provide specific feedback and do NOT reset progress
            if neededStones <= 0 then
                player:printToPlayer("All materials have been provided. Please trade me only the weapon to finalize the upgrade.", 0, "Oboro")
            else
                player:printToPlayer("Your trade does not match my requirements for finalizing the upgrade. Please ensure you are trading the weapon with the exact remaining materials.", 0, "Oboro")
            end
            return
        end
    end

    -- Error Catch-all
    if weaponRegistered > 0 then
        local currentData = getUpgradeData(weaponRegistered) -- This should always be valid if weaponRegistered > 0
        local needed      = currentData.qty - materialCount
        if needed <= 0 then
            player:printToPlayer("All materials have been provided. Please trade me only the weapon to finalize the upgrade.", 0, "Oboro")
        else
            player:printToPlayer("I still require " .. needed .. " more materials before I can begin work on your weapon. Progress: " .. player:getCharVar("[Oboro]MaterialCount") .. " / " .. currentData.qty .. ". (Need " .. needed .. " more).", 0, "Oboro")
        end
        return
    end

    player:printToPlayer("If you seek to strengthen a weapon of legend, you must first allow me to inspect it.", 0, "Oboro")
end

entity.onTrigger = function(player, npc)
    local upgradeWeapon = player:getCharVar("[Oboro]UpgradeWeapon")
    local weaponRegistered = player:getCharVar("[Oboro]WeaponRegistered")
    local upgradeMidnight = player:getCharVar("[Oboro]UpgradeMidnight")
    local now = os.time()

    -- Check if an upgrade is ready
    if upgradeWeapon > 0 then
        if now >= upgradeMidnight then
            if player:getFreeSlotsCount() > 0 then
                if npcUtil.giveItem(player, upgradeWeapon) then
                    player:setCharVar("[Oboro]BaseWeapon", 0)
                    player:setCharVar("[Oboro]UpgradeWeapon", 0)
                    player:setCharVar("[Oboro]UpgradeMidnight", 0)
                    player:printToPlayer("It is finished. A masterpiece of destruction. Take it.", 0, "Oboro")
                end
            else
                player:printToPlayer("Your weapon is ready, but your pockets are full.", 0, "Oboro")
            end
        else
            player:printToPlayer("Patience is a virtue. I am still working on your steel. Do you wish to abandon this project? Your materials will not be returned.", 0, "Oboro")
            player:customMenu({
                title = "Cancel current weapon?",
                options = {
                    { "Yes, abandon the project.", function(p)
                        local baseWeapon = p:getCharVar("[Oboro]BaseWeapon")
                        if baseWeapon == 0 or npcUtil.giveItem(p, baseWeapon) then
                            p:setCharVar("[Oboro]UpgradeWeapon", 0)
                            p:setCharVar("[Oboro]UpgradeMidnight", 0)
                            p:setCharVar("[Oboro]BaseWeapon", 0)
                            p:setCharVar("[Oboro]MaterialCount", 0)
                            p:setCharVar("[Oboro]WeaponRegistered", 0)
                            p:printToPlayer("As you wish. The project is abandoned. I return your weapon, but the materials are lost.", 0, "Oboro")
                        end
                    end },
                    { "No, I will wait.", function(p)
                        p:printToPlayer("I shall return to my hammer and anvil, then.", 0, "Oboro")
                    end },
                }
            })
        end
        return
    end

    -- Project Progress Check
    if weaponRegistered > 0 and upgradeWeapon == 0 then
        local currentData = getUpgradeData(weaponRegistered)
        local needed = currentData.qty - player:getCharVar("[Oboro]MaterialCount")
        player:printToPlayer("I am currently waiting on materials for your " .. GetItemByID(weaponRegistered):getName() .. ". Progress: " .. player:getCharVar("[Oboro]MaterialCount") .. " / " .. currentData.qty .. ". (Need " .. needed .. " more).", 0, "Oboro")
        player:customMenu({
            title = "Do you wish to abandon this project?",
            options = {
                { "Yes, abandon the project.", function(p)
                    p:setCharVar("[Oboro]WeaponRegistered", 0)
                    p:setCharVar("[Oboro]MaterialCount", 0)
                    p:setCharVar("[Oboro]BaseWeapon", 0)
                    p:setCharVar("[Oboro]UpgradeWeapon", 0)
                    p:setCharVar("[Oboro]UpgradeMidnight", 0)
                    p:printToPlayer("As you wish. The project is abandoned. The materials are lost.", 0, "Oboro")
                end },
                { "No, I will continue.", function(p)
                    p:printToPlayer("I shall return to my hammer and anvil, then.", 0, "Oboro")
                end },
            }
        })
        return
    end

    -- Initial Equipment Check
    local slotsToSearch = { xi.slot.MAIN, xi.slot.SUB, xi.slot.RANGED }
    local eligibleId = 0

    for _, slot in ipairs(slotsToSearch) do
        local id = player:getEquipID(slot)
        if upgradeMap[id] then
            eligibleId = id
            break
        end
    end

    if eligibleId > 0 then
        player:setCharVar("[Oboro]EquipCheck", eligibleId)
        player:printToPlayer("Ah, I see you carry an ultimate weapon. If you trade it to me, I may be able to help you unlock its true potential.", 0, "Oboro")
    else
        player:printToPlayer("I am Oboro. If you seek to strengthen the weapons of legend, speak to me with one in your hands.", 0, "Oboro")
    end
end

entity.onEventUpdate = function(player, csid, option, npc)

end

entity.onEventFinish = function(player, csid, option, npc)

end

return entity
