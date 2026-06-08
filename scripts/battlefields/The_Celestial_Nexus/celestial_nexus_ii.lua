-----------------------------------
-- Area: The Celestial Nexus
-- Name: The Celestial Nexus (ZM16)
-----------------------------------
local celestialNexusID = zones[xi.zone.THE_CELESTIAL_NEXUS]
-----------------------------------

local content = Battlefield:new({
    zoneId        = xi.zone.THE_CELESTIAL_NEXUS,
    battlefieldId = xi.battlefield.id.CELESTIAL_NEXUS_II,
    canLoseExp    = false,
    allowTrusts   = true,
    maxPlayers    = 6,
    levelCap      = 99,
    timeLimit     = utils.minutes(30),
    index         = 1,
    area          = 1,
    entryNpc      = '_513',
    exitNpcs      = { '_514', '_515' },
    requiredKeyItems = { xi.ki.CELESTIAL_NEXUS_PHANTOM_GEM, keep = false }, 
})

function content:onEventFinishBattlefield(player, csid, option, npc)
    if csid == 32004 then
        local battlefield = player:getBattlefield()
        local phaseTwoId  = content.groups[4].mobIds[1]
        local phaseTwo    = GetMobByID(phaseTwoId)

        if phaseTwo then
            if phaseTwo:isSpawned() then
                return
            end

            DespawnMob(content.groups[1].mobIds[1])
            SpawnMob(phaseTwoId)

            phaseTwo:setLocalVar('targetId', player:getTargID())
            phaseTwo:timer(30000, function(mobArg)
                phaseTwo:engage(mobArg:getLocalVar('targetId'))
            end)
        end
    end
end

content.groups =
{
    -- Phase 1 - Eald'narche
    {
        mobIds =
        {
            celestialNexusID.mob.EALDNARCHE_HTBF,
        },

        death = function(battlefield, mob)
            for _, orbitalId in ipairs(content.groups[3].mobIds) do
                DespawnMob(orbitalId)
            end

            local players = battlefield:getPlayers()
            for _, player in pairs(players) do
                player:startEvent(32004, battlefield:getArea())
            end
        end
    },

    -- Phase 1 - Exoplates
    {
        mobIds =
        {
            celestialNexusID.mob.EXOPLATES_HTBF,
        },
    },

    -- Phase 1 - Orbitals
    {
        mobIds =
        {
            celestialNexusID.mob.ORBITAL_HTBF,
            celestialNexusID.mob.ORBITAL_HTBF + 1,
        },

        spawned = false,
    },

    -- Phase 2 - Eald'narche
    {
        mobIds =
        {
            celestialNexusID.mob.EALDNARCHE_2_HTBF,
        },

        spawned = false,
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
        end
    },
}

content.loot =
{
    {
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_7,     weight =  1000}, -- Rem Tale Ch 7 
    },
    {
        { itemId = xi.item.NONE,                            weight = 750 }, -- nothing
        { itemId = xi.item.COPY_OF_REMS_TALE_CHAPTER_7,     weight =  50}, -- Rem Tale Ch 7 
    },
    {
        { itemId = xi.item.NONE,                            weight = 250 }, -- nothing
        { itemId = xi.item.PIECE_OF_MALIYAKALEYA_CORAL,     weight = 187 }, -- Exalted Log
        { itemId = xi.item.SIFS_LOCK,                       weight = 187 },
        { itemId = xi.item.CHUNK_OF_BERYLLIUM_ORE,          weight = 187 }, -- Hepatizon Ore
        { itemId = xi.item.WYRM_BLOOD,                      weight = 187 }, -- Wyrm Blood
    },
    {
        { itemId = xi.item.NONE,                    weight = 50 }, -- nothing
        { itemId = xi.item.VANIR_KNIFE,             weight = 10 }, -- 
        { itemId = xi.item.VANIR_GUN,               weight = 10 }, -- 
        { itemId = xi.item.SERAPHICALLER,           weight = 10 }, -- Seraphicaller
        { itemId = xi.item.DIVINATOR,               weight = 10 }, -- Divinator
        { itemId = xi.item.DIVINATOR_II,            weight = 10 }, -- Divinator II
    },
    {
        { itemId = xi.item.NONE,                    weight = 50 }, -- nothing
        { itemId = xi.item.VANIR_COTEHARDIE,        weight = 2 }, -- 
        { itemId = xi.item.VANIR_BATTERY,           weight = 10 }, 
        { itemId = xi.item.VANIR_BOOTS,             weight = 10 },
    },
}

return content:register()
