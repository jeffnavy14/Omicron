-----------------------------------
-- Area: Norg
-- NPC:  Oseem
-----------------------------------
require('scripts/globals/npc_util')
require('scripts/globals/oseem_custom')

local entity = {}

-----------------------------------
-- HELPER: Clear Recovery Memory
-----------------------------------
local function clearOseemVars(player)
    player:setCharVar("Oseem_GearID", 0)
    for i = 1, 4 do
        player:setCharVar("Oseem_OldId_" .. i, 0)
        player:setCharVar("Oseem_OldVal_" .. i, 0)
        player:setCharVar("Oseem_NewId_" .. i, 0)
        player:setCharVar("Oseem_NewVal_" .. i, 0)
    end
end

-----------------------------------
-- HELPER: Rebuild Item and Give
-----------------------------------
local function giveItemBack(player, itemId, prefix)
    local finalAugments = {}

    for i = 1, 4 do
        local aId = player:getCharVar(prefix .. "Id_" .. i)
        local aVal = player:getCharVar(prefix .. "Val_" .. i)
        if aId ~= 0 then
            table.insert(finalAugments, { id = aId, value = aVal })
        end
    end

    local itemData = {
        id       = itemId,
        quantity = 1,
        exdata   = {
            augmentKind    = xi.augment.kind.HAS_AUGMENTS,
            augmentSubKind = xi.augment.subKind.STANDARD,
            augments       = finalAugments
        }
    }

    player:addItem(itemData)
    clearOseemVars(player)
end

-----------------------------------
-- ONTRIGGER: Crash Recovery Check
-----------------------------------
entity.onTrigger = function(player, npc)
    local recoveryGearId = player:getCharVar("Oseem_GearID")

    if recoveryGearId ~= 0 then
        giveItemBack(player, recoveryGearId, "Oseem_Old")
        player:printToPlayer("Oseem: You vanished while deciding! I kept your original engraving safe.")
        return
    end

    player:printToPlayer("Oseem: Trade me a piece of Reisenjima gear and an Arcane stone to begin engraving.", 0x1F)
end

-----------------------------------
-- ONTRADE: Trade Processing & Menu
-----------------------------------
entity.onTrade = function(player, npc, trade)
    if player:getCharVar("Oseem_GearID") ~= 0 then
        return
    end

    if trade:getItemCount() == 2 then
        local gearItem, gearId, gearSlot = nil, 0, 0
        local stoneName, stoneSlot = nil, 0

        for slot = 0, 1 do
            local item = trade:getItem(slot)
            if item then
                if xi.oseem.validGear[item:getID()] then
                    gearItem = item
                    gearId = item:getID()
                    gearSlot = slot
                elseif xi.oseem.stones[item:getID()] then
                    stoneName = xi.oseem.stones[item:getID()]
                    stoneSlot = slot
                end
            end
        end

        if gearItem and stoneName then
            local gearFamily = xi.oseem.validGear[gearId]

            player:setCharVar("Oseem_GearID", gearId)
            
            for i = 1, 4 do
                local aId, aVal = gearItem:getAugment(i)
                player:setCharVar("Oseem_OldId_" .. i, aId)
                player:setCharVar("Oseem_OldVal_" .. i, aVal)
            end

            local newAugs = xi.oseem.rollNewAugments(stoneName, gearFamily)
            local previewText = "Proposed Augments: "
            
            for i, aug in ipairs(newAugs) do
                player:setCharVar("Oseem_NewId_" .. i, aug.id)
                player:setCharVar("Oseem_NewVal_" .. i, aug.value)
                
                local name = xi.oseem.getAugName(aug.id)
                previewText = previewText .. " • " .. name .. " " .. (aug.value > 0 and "+" or "") .. aug.value
            end

            trade:confirmSlot(gearSlot, 1)
            trade:confirmSlot(stoneSlot, 1)
            player:confirmTrade()

            player:timer(100, function(p)
                p:printToPlayer(previewText, 0x1F)
                
                p:customMenu({
                    title = "Oseem's Engraving",
                    options = {
                        { "Keep NEW Augments", function(pp)
                            giveItemBack(pp, gearId, "Oseem_New")
                            pp:printToPlayer("Oseem: The new engraving is complete.")
                        end },
                        { "Keep OLD Augments", function(pp)
                            giveItemBack(pp, gearId, "Oseem_Old")
                            pp:printToPlayer("Oseem: I have left the original engraving intact. Stone consumed.")
                        end }
                    }
                })
            end)
        end
    end
end

return entity