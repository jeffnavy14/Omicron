-----------------------------------
-- Area: Sealion's Den
-- Name: One to be Feared HTBF
-----------------------------------
local sealionsDenID = zones[xi.zone.SEALIONS_DEN]
-----------------------------------

local content = Battlefield:new({
    zoneId        = xi.zone.SEALIONS_DEN,
    battlefieldId = xi.battlefield.id.ONE_TO_BE_FEARED_II,
    canLoseExp    = false,
    allowTrusts   = true,
    maxPlayers    = 6,
    levelCap      = 99,
    timeLimit     = utils.minutes(45),
    index         = 3,
    entryNpc      = '_0w0',
    exitNpc       = 'Airship_Door',
    requiredKeyItems = { xi.ki.FEARED_ONE_PHANTOM_GEM, keep = false  },
})

-- NOTE: Mob spawning for phase changes in this battlefield is triggered
-- by the airship door, which is also the battlefield exit.  Exit has been
-- purposefully omitted from this to allow that function.

local function healCharacter(player)
    if player:isAlive() then
        player:setHP(player:getMaxHP())
        player:setMP(player:getMaxMP())
        player:setTP(0)

        if player:getPet() ~= nil then
            local pet = player:getPet()
            pet:setHP(pet:getMaxHP())
            pet:setMP(pet:getMaxMP())
            pet:setTP(0)
        end
    end
end

local function returnToAirship(player)
    local battlefieldArea = player:getBattlefield():getArea()

    if battlefieldArea == 1 then
        player:setPos(-780.132, -103.347, -88.692, 193)
    elseif battlefieldArea == 2 then
        player:setPos(-140.029, -23.348, -446.376, 193)
    elseif battlefieldArea == 3 then
        player:setPos(499.969, 56.652, -806.132, 193)
    end

    if player:isDead() then
        player:allowSendRaisePrompt()
    end
end

content.groups =
{
    {
        mobIds =
        {
            { sealionsDenID.mob.OMEGA_HTBF      },
            { sealionsDenID.mob.OMEGA_HTBF + 2  },
            { sealionsDenID.mob.OMEGA_HTBF + 4  },
        },


        allDeath = function(battlefield, mob)
            for _, player in pairs(battlefield:getPlayers()) do
                    healCharacter(player)
                    returnToAirship(player)
                    player:startEvent(11)
            end
        end,
    },

    {
        mobIds =
        {
            { sealionsDenID.mob.ULTIMA_HTBF      },
            { sealionsDenID.mob.ULTIMA_HTBF + 2  },
            { sealionsDenID.mob.ULTIMA_HTBF + 4  },
        },

        spawned  = true,
        allDeath = function(battlefield, mob)
            local players = battlefield:getPlayers()
            battlefield:setStatus(xi.battlefield.status.WON)

            local rewardItems = { xi.item.BOULDER_CASE, xi.item.PLUTON_CASE, xi.item.BEITETSU_PARCEL }
            for _, player in ipairs(players) do
                local randomItem = rewardItems[math.random(#rewardItems)]
                npcUtil.giveItem(player, randomItem)
            end


            if #players > 0 then
                players[1]:timer(7000, function(p) -- timer to drop loot
                    local selectedLoot = utils.selectFromLootGroups(p, content.loot)
                    for _, item in ipairs(selectedLoot) do
                        if item.itemId ~= xi.item.NONE then
                            -- Add to treasure pool of the first player (shared with party)
                            p:addTreasure(item.itemId, mob)
                        end
                    end
                end)
            end
        end,
    },
}

content.loot =
{
    {
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_10,     weight =  1000},  
    },

    {
        { itemId = xi.item.NONE,                             weight = 750 }, -- nothing
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_10,     weight = 250}, 
    },
    --Unique Materials
    {
        { itemId = xi.item.NONE,                    weight = 167 }, -- nothing
        { itemId = xi.item.EXALTED_LOG,             weight = 166 }, -- Exalted Log
        { itemId = xi.item.HEPATIZON_ORE,           weight = 166 }, -- Hepatizon Ore
        { itemId = xi.item.MALIYAKALEYA_ORB,        weight = 166 }, -- Maliyakaleya Coral
        { itemId = xi.item.CHUNK_OF_BERYLLIUM_ORE,  weight = 166 }, -- Beryllium Ore
        { itemId = xi.item.SIFS_LOCK,               weight = 166 }, -- Sif's Lock
    },
    --Weapons
    {
        { itemId = xi.item.NONE,                weight = 667 }, -- nothing
        { itemId = xi.item.DENOUEMENTS,        	weight = 167 },
        { itemId = xi.item.CULMINUS,        	weight = 166 },  
    },
    --Armor
    {
        { itemId = xi.item.NONE,                    weight = 333 }, -- nothing
        { itemId = xi.item.TERMINAL_HELM,           weight = 166 },
        { itemId = xi.item.TERMINAL_PLATE,          weight = 166 },
        { itemId = xi.item.CESSANCE_EARRING,        weight = 166 },
        { itemId = xi.item.CONSUMMATION_TORQUE,     weight = 166 },
    },
}

return content:register()
